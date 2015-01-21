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
#include "BSLStack.h"

#include "BSLStatement_Fork.h"
#include "BSLStatement_Conditional.h"
#include "BSLStatement_Sleep.h"
#include "BSLStatement_Return.h"
#include "BSLStatement_Iterate.h"
#include "BSLStatement_Schedule.h"
#include "BSLStatement_Var.h"
#include "BSLStatement_Func.h"

int bsl_function_interp_expression_increment(bsl_tkn_ir **token, bsl_interpreted_code interp, uint32_t *index) {
	
	bsl_tkn_ir *curr = *token;
	
	if (curr->next == NULL) {
		// check to make sure we aren't over-running
		if ((*index) + 1 >= interp.expression_count) {
			return -1;
		}
		// increasing index to next expression
		(*index)++;
		
		// assign the current ir item to the start of the ir sequence in the next expression
		curr = interp.expression[(*index)].tokens;
		
		if (curr == NULL) {
			
		}
	}
	else {
		curr = curr->next;
	}
	
	*token = curr;
	
	return 0;
}

int bsl_function_interp_expression_decrement(bsl_tkn_ir **token, bsl_interpreted_code interp, uint32_t *index) {
	
	bsl_tkn_ir *curr = *token;
	
	if (curr->prev == NULL) {
		// check to make sure we aren't over-running
		if ((*index) == 0) {
			return -1;
		}
		// increasing index to next expression
		(*index)--;
		
		// assign the current ir item to the start of the ir sequence in the next expression
		curr = interp.expression[(*index)].tokens;
		
		while (curr->next != NULL) {
			curr = curr->next;
		}
	}
	else {
		curr = curr->prev;
	}
	
	*token = curr;
	
	return 0;
}

int bsl_function_interp_expression_increment_token(bsl_tkn_ir **item, bsl_interpreted_code interp, uint32_t *index) {
	bsl_tkn_ir *curr = *item;
	
	int result = bsl_function_interp_expression_increment(&curr, interp, index);
	
	while (curr->token == NULL) {
		result = bsl_function_interp_expression_increment(&curr, interp, index);
		
		if (result == -1) {
			break;
		}
	}
	
	*item = curr;
	
	return result;
}

int bsl_function_interp_expression_decrement_token(bsl_tkn_ir **item, bsl_interpreted_code interp, uint32_t *index) {
	bsl_tkn_ir *curr = *item;
	
	int result = 0;
	
	while (curr->token != NULL) {
		result = bsl_function_interp_expression_decrement(&curr, interp, index);
		
		if (result == -1) {
			break;
		}
	}
	
	result = bsl_function_interp_expression_decrement(&curr, interp, index);
	
	*item = curr;
	
	return result;
}

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
			
			result = bsl_stack_search_scope(name, context);
			if (result != NULL) {
				
				if (result->type == bsl_symbol_type_function) {
					code = BSLTokenCode_type_func;
				}
				
				if (result->type == bsl_symbol_type_variable) {
					code = BSLTokenCode_type_var;
				}
				
				context->stack->active->symbol = result;
			}
			else {
				printf("");
			}
			
		}
		else {
			
			switch (code) {
				case BSLTokenCode_id_int:
				case BSLTokenCode_id_float:
				case BSLTokenCode_id_bool:
				case BSLTokenCode_id_string:
				case BSLTokenCode_id_false:
				case BSLTokenCode_id_true: {
					printf("");
					// create constant
					expr.type = bsl_statement_type_var;
					
					expr.u.var = bsl_statement_const_create(&curr, context);
					
					*item = curr;
					
					return expr;
				}
				default: {
					break;
				}
			}
		}
		
		switch (code) {
			case BSLTokenCode_type_func: {
				expr.type = bsl_statement_type_func;
				
				expr.u.func = bsl_statement_func_create(&curr, context);
				
				if (curr->next != NULL) {
					
					if (curr->token != NULL) {
						
						if (curr->token->code == BSLTokenCode_ctl_rparen) {
							
							curr = curr->next;
						}
					}
				}
				
				(*index)++;
				
				break;
			}
			case BSLTokenCode_id_var: { // creating a local variable
				expr.type = bsl_statement_type_var;
				
				expr.u.var = bsl_statement_var_create(&curr, context);
				
				(*index)++;
				
				break;
			}
			case BSLTokenCode_type_var: { // assigning a value
				expr.type = bsl_statement_type_var;
				
				expr.u.var = bsl_statement_var_assign(&curr, context);
				
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
				
				debug_printf("%s","\t{\n");
				
				int8_t *case_eval = calloc(expr.u.conditional.case_count, sizeof(int8_t));
				for (int8_t eval_index = 0; eval_index < expr.u.conditional.case_count; eval_index++) {
					bsl_statement_conditional_case cond_case = expr.u.conditional.cond_case[eval_index];
					
					case_eval[eval_index] = bsl_conditional_evaluation(cond_case.cond, &context);
				}
				
				for (int8_t exec_index = 0; exec_index < expr.u.conditional.case_count; exec_index++) {
					
					if (case_eval[exec_index] == 1) {
						
						bsl_execute_interpreted_code(expr.u.conditional.cond_case[exec_index].code, &context);
						
						break;
					}
				}
				
				debug_printf("%s","\t}\n");
				
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