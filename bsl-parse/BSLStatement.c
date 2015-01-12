//
//  BSLStatement.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/29/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLStatement.h"
#include "BSLTokenDefinitions.h"
#include "BSLVariable.h"
#include "BSLFunction.h"
#include "BSLParse.h"
#include "BSLExecute.h"

#include "BSLStatement_Fork.h"
#include "BSLStatement_Conditional.h"
#include "BSLStatement_Sleep.h"
#include "BSLStatement_Return.h"
#include "BSLStatement_Iterate.h"
#include "BSLStatement_Schedule.h"
#include "BSLStatement_Var.h"
#include "BSLStatement_Func.h"

bsl_statement bsl_statement_parse(bsl_tkn_ir **item, bsl_context *context, bsl_interpreted_code interp, uint32_t *index) {
	bsl_statement expr = {0};
	expr.type = bsl_statement_type_invalid;
	
	bsl_tkn_ir *curr = (*item);
	
	debug_printf("%s","evaluate expression: ");
	
	char *str = bsl_token_ir_copy_string(curr);
	debug_printf(" < %s > \n\t",str);
	free(str);
	
	if (curr->token != NULL) {
		
		bsl_token_code code = bsl_token_resolve_identifier(curr->token);
		
		bsl_symbol *result = NULL;
		
		if (code == BSLTokenCode_id_generic) {
			
			char *name = calloc(curr->token->offset.length + 1, sizeof(char));
			strncpy(name, curr->token->contents, curr->token->offset.length);
			
			result = bsl_db_get_global(name, context);
			if (result != NULL) {
				
				if (result->type == bsl_symbol_type_function) {
					code = BSLTokenCode_type_func;
				}
				
				if (result->type == bsl_symbol_type_variable) {
					code = BSLTokenCode_type_var;
				}
				
				context->stack->active->symbol = result;
			}
			
		}
		
		switch (code) {
			case BSLTokenCode_type_func: {
				expr.type = bsl_statement_type_func;
				
				expr.u.func = bsl_statement_func_create(&curr, context);
				
				(*index)++;
				
				break;
			}
			case BSLTokenCode_type_var: {
				expr.type = bsl_statement_type_var;
				
				expr.u.var = bsl_statement_var_create(&curr, context);
				
				(*index)++;
				
				break;
			}
			case BSLTokenCode_id_schedule: {
				expr.type = bsl_statement_type_schedule;
				
				expr.u.schedule = bsl_statement_schedule_create(&curr, context);
				
				(*index)++;
				
				break;
			}
			case BSLTokenCode_id_iterate: {
				expr.type = bsl_statement_type_iterate;
				
				expr.u.iterate = bsl_statement_iterate_create(&curr, context);
				
				(*index)++;
				
				break;
			}
			case BSLTokenCode_id_return: {
				expr.type = bsl_statement_type_return;
				
				expr.u.ret = bsl_statement_return_create(&curr, context);
				
				(*index)++;
				
				break;
			}
			case BSLTokenCode_id_sleep: {
				expr.type = bsl_statement_type_sleep;
				
				expr.u.sleep = bsl_statement_sleep_create(&curr, context);
				
				(*index)++;
				
				break;
			}
			case BSLTokenCode_id_fork: {
				expr.type = bsl_statement_type_fork;
				
				expr.u.fork = bsl_statement_fork_create(&curr, context);
				
				(*index)++;
				
				break;
			}
			case BSLTokenCode_id_if: {
				expr.type = bsl_statement_type_conditional;
				
				expr.u.conditional = bsl_statement_conditional_create(&curr, context, interp, index);
				
				int8_t *case_eval = calloc(expr.u.conditional.case_count, sizeof(int8_t));
				for (int8_t index = 0; index < expr.u.conditional.case_count; index++) {
					bsl_statement_conditional_case cond_case = expr.u.conditional.cond_case[index];
					
					if (cond_case.cond->type == bsl_conditional_type_else) {
						case_eval[index] = 1;
					}
					else {
						case_eval[index] = bsl_conditional_evaluation(cond_case.cond, &context);
					}
				}
				
				for (int8_t index = 0; index < expr.u.conditional.case_count; index++) {
					
					if (case_eval[index] == 1) {
						
						bsl_execute_interpreted_code(expr.u.conditional.cond_case[index].code, &context);
						break;
					}
				}
				
				break;
			}
			default: {
				
				debug_printf("%s","unknown: ");
				
				context->error = bsl_error_token_invalid_syntax;
				// error
				break;
			}
		}
	}
	
	debug_printf("%s","\n");
	
	*item = curr;
	
	return expr;
}