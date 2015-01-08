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

bsl_statement bsl_statement_parse(bsl_tkn_ir **item, bsl_context *context) {
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
				
				debug_printf("%s","function call: ");
				
				if (result != NULL) {
					
					context->stack->active->scope_level	= BSLScope_func;
					context->stack->active->scope_depth += 1;
					
					bsl_symbol_parse_call(&context, result->u.func.rtype, result->u.func.args, result->u.func.arg_count);
					
					
					context->stack->active->scope_depth -= 1;
				}
				
				break;
			}
			case BSLTokenCode_type_var: {
				expr.type = bsl_statement_type_var;
				
				debug_printf("%s","variable assignment: ");
				
				if (result != NULL) {
					
				}
				
				break;
			}
			case BSLTokenCode_id_schedule: {
				expr.type = bsl_statement_type_schedule;
				
				debug_printf("%s","schedule: ");
				
				bsl_tkn_ir *at = curr;
				// function call
				
				// 'at' identifier
				while (at != NULL) {
					
					if (at->token != NULL) {
						
						if (at->token->code == BSLTokenCode_id_at) {
							break;
						}
					}
					
					at = at->next;
				}
				
				if (at != NULL) {
				
					if (at->token->code == BSLTokenCode_id_at) {
						
						curr = at->next;
					}
				}
				else {
					// error, could not find keyword
				}
				
				// time value
				
				break;
			}
			case BSLTokenCode_id_iterate: {
				expr.type = bsl_statement_type_iterate;
				
				debug_printf("%s","iterate: ");
				
				// 'over' identifier
				
				// variable identifier
				
				// 'using' identifier
				
				// variable identifier
				
				// scope { }
				
				break;
			}
			case BSLTokenCode_id_return: {
				expr.type = bsl_statement_type_return;
				
				debug_printf("%s","return: ");
				
				// return value, stop evaluating
				
				break;
			}
			case BSLTokenCode_id_sleep: {
				expr.type = bsl_statement_type_sleep;
				
				debug_printf("%s","sleep: ");
				
				if (curr->next == NULL) {
					// parse error
				}
				
				// advance to sleep value
				curr = curr->next;
				
				// remove this code and give to scheduler to run instead.
				
				// add error checking here
				
				if (curr->token->code == BSLTokenCode_id_int || curr->token->code == BSLTokenCode_type_int) {
					//				bsl_variable *sleep_time = bsl_variable_create_from_token(curr->token, context);
					//
					//				if (sleep_time != NULL) {
					//
					//					if (sleep_time->type == bsl_variable_int) {
					//						useconds_t time_val = (sleep_time->u.i / 60) * 1000;
					//
					//						usleep(time_val);
					//					}
					//					else {
					//						// error
					//					}
					//
					//					bsl_variable_release(*sleep_time);
					//				}
					
				}
				else {
					// there is an error in parsing
				}
				
				break;
			}
			case BSLTokenCode_id_fork: {
				expr.type = bsl_statement_type_fork;
				
				debug_printf("%s","fork: ");
				
				if (curr->next == NULL) {
					// error
				}
				
				curr = curr->next;
				
				// do function on separate thread
				
				break;
			}
			case BSLTokenCode_id_if: {
				expr.type = bsl_statement_type_conditional;
				
				context->stack->active->scope_level = BSLScope_cond;
				
				debug_printf("%s","conditional evaluation: ");
				
				// parse logic expression
				
				// scope (optional)
				
				// logical statement
				
				// else (if) (optional) repeat parsing ^^^
				
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