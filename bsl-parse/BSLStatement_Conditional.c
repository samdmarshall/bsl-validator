//
//  BSLStatement_Conditional.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Conditional.h"
#include "BSLToken.h"
#include "BSLStatement.h"


bsl_statement_conditional bsl_statement_conditional_create(bsl_tkn_ir **token, bsl_context *context, bsl_interpreted_code interp, uint32_t *index) {
	bsl_statement_conditional conditional = {0};
	conditional.cond_case = calloc(1, sizeof(bsl_statement_conditional_case));
	conditional.case_count = 1;
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","conditional evaluation:\n");
	
if_loop:
	{
		bsl_statement_conditional_case *cond_case = &(conditional.cond_case[conditional.case_count - 1]);
		cond_case->cond = calloc(1, sizeof(bsl_conditional));
		
		int result = 0;

		// parse logic expression
		if (curr->token != NULL) { // check to make sure we have a token
			// check to make sure we still have the starting `if`
			if (curr->token->code == BSLTokenCode_id_if) {
				
				cond_case->cond->type = bsl_conditional_type_if;
			}
			else if (curr->token->code == BSLTokenCode_id_else) {
				
				cond_case->cond->type = bsl_conditional_type_else;
			}
			else {
				// error
				context->error = bsl_error_token_invalid_syntax;
			}
		}
		
		result = bsl_function_interp_expression_increment(&curr, interp, index);
		
		// track the close scope
		int8_t scope_tracker = 0;
		
		while (curr != NULL && result == 0) {
			
			if (curr->token != NULL) {
				bsl_token_check_scope_increase(&scope_tracker, curr->token, BSLTokenCode_ctl_lparen);
				bsl_token_check_scope_decrease(&scope_tracker, curr->token, BSLTokenCode_ctl_rparen);
			}
			
			// add ir to conditional
			
			if (scope_tracker == 0) {
				// end of scope, break from loop
				break;
			}

			curr = curr->next;
		}

		// smart advancing past conditional to expressions
		result = bsl_function_interp_expression_increment_token(&curr, interp, index);
		
		// used to track if we only should read one expression or not
		int8_t found_brace = 0;
		// tracking depth scope of braces
		int8_t brace_scope = 0;
		
		if (curr->token->code == BSLTokenCode_ctl_lbrace) {
			bsl_token_check_scope_increase(&brace_scope, curr->token, BSLTokenCode_ctl_lbrace);
			found_brace = 1;
			result = bsl_function_interp_expression_increment(&curr, interp, index);
		}
		
		cond_case->code.expression = calloc(1, sizeof(bsl_expression));
		cond_case->code.expression_count = 1;
		
		int8_t found_else = 0;
		
		while (((found_brace == 0) || (found_brace == 1 && brace_scope != 0)) && result == 0) {
			bsl_expression *case_expr = &(cond_case->code.expression[cond_case->code.expression_count - 1]);
			case_expr->scope_type = BSLScope_cond;
			case_expr->scope_level = brace_scope;
			
			if (curr->token != NULL) {
				// store expression
				bsl_token_check_scope_increase(&brace_scope, curr->token, BSLTokenCode_ctl_lbrace);
				bsl_token_check_scope_decrease(&brace_scope, curr->token, BSLTokenCode_ctl_rbrace);
			}
			else {
				
				while (curr->token == NULL) {
					result = bsl_function_interp_expression_increment(&curr, interp, index);
				}
				
				continue;
			}
			
			if (brace_scope == 0) {
				
				// check the end of the brace
				// check the next token for `else`
				//		-> jump back to do another conditional
				//		-> break
				
				if (curr->token->code == BSLTokenCode_ctl_rbrace) {
					result = bsl_function_interp_expression_increment_token(&curr, interp, index);
					
					if (curr->token != NULL) {
						
						if (curr->token->code == BSLTokenCode_id_else) {
							found_else = 1;
							
							// check for next if
							result = bsl_function_interp_expression_increment_token(&curr, interp, index);
							
							if (curr->token->code != BSLTokenCode_id_if) {
								
								result = bsl_function_interp_expression_decrement_token(&curr, interp, index);
							}
						}
						
						if (found_else == 1) {
							
							conditional.case_count += 1;
							conditional.cond_case = realloc(conditional.cond_case, sizeof(bsl_statement_conditional_case) * (conditional.case_count));
							
							conditional.cond_case[conditional.case_count - 1].code.expression_count = 0;
							conditional.cond_case[conditional.case_count - 1].code.expression = NULL;
							conditional.cond_case[conditional.case_count - 1].cond = NULL;
							
							goto if_loop;
						}
						else {
							break;
						}
					}
					else {
						break;
					}
					
				}
				
			}
			else {
				
				// in here the expressions need to be parsed out
				
				cond_case->code.expression = realloc(cond_case->code.expression, sizeof(bsl_expression) * (cond_case->code.expression_count + 1));
				cond_case->code.expression_count += 1;

				cond_case->code.expression[cond_case->code.expression_count - 1].scope_level = 0; // FIXME
				cond_case->code.expression[cond_case->code.expression_count - 1].scope_type = BSLScope_invalid; // FIXME
				cond_case->code.expression[cond_case->code.expression_count - 1].tokens = curr;
				
				while (curr->token != NULL) {
					result = bsl_function_interp_expression_increment(&curr, interp, index);
					
					if (result != 0) {
						// error
					}
				}
				
				result = bsl_function_interp_expression_increment(&curr, interp, index);
			}
			
		}
		
	}
	
	// move current position
	*token = curr;
	
	return conditional;
}

int8_t bsl_conditional_evaluation(bsl_conditional *cond, bsl_context **context) {
	int8_t result = 0;
	
	
	
	return result;
}