//
//  BSLStatement_Conditional.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Conditional.h"
#include "BSLToken.h"

int bsl_function_interp_expression_increment(bsl_tkn_ir **token, bsl_interpreted_code interp, uint32_t *index) {
	
	bsl_tkn_ir *curr = *token;
	
	if (curr->next == NULL) {
		// check to make sure we aren't over-running
		if ((*index) + 1 > interp.expression_count) {
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

bsl_statement_conditional bsl_statement_conditional_create(bsl_tkn_ir **token, bsl_context *context, bsl_interpreted_code interp, uint32_t *index) {
	bsl_statement_conditional conditional = {0};
	conditional.cond_case = calloc(1, sizeof(bsl_statement_conditional_case));
	conditional.case_count = 1;
	
	bsl_tkn_ir *curr = *token;
	
if_loop:
	{
		bsl_statement_conditional_case *cond_case = &(conditional.cond_case[conditional.case_count - 1]);
		cond_case->cond = calloc(1, sizeof(bsl_conditional));
		
		int result = 0;
		
		debug_printf("%s","conditional evaluation: ");

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
		result = bsl_function_interp_expression_increment(&curr, interp, index);
		
		while (curr->token == NULL) {
			result = bsl_function_interp_expression_increment(&curr, interp, index);
		}
		
		printf("");
		// used to track if we only should read one expression or not
		int8_t found_brace = 0;
		// tracking depth scope of braces
		int8_t brace_scope = 0;
		
		
//
//		// smart advancing past conditional to expressions
//		result = bsl_function_interp_expression_increment(&curr, interp, index);
//		
//		if (curr->token != NULL) {
//			// used to track if we only should read one expression or not
//			int found_brace = 0;
//			// tracking depth scope of braces
//			int8_t brace_scope = 0;
//			// check if using a encapsulating brace
//			if (curr->token->code == BSLTokenCode_ctl_lbrace) {
//				// found a brace, track scope and advance
//				found_brace = 1;
//				// increase brace scope
//				brace_scope += 1;
//				
//				// smart advancing to next ir item
//				result = bsl_function_interp_expression_increment(&curr, interp, index);
//			}
//			
//			cond_case->code.expression = calloc(1, sizeof(bsl_expression));
//			cond_case->code.expression_count = 1;
//			
//			int8_t found_else = 0;
//			while (((found_brace == 0) || (found_brace == 1 && brace_scope != 0)) && result == 0) {
//				
//				bsl_expression *case_expr = &(cond_case->code.expression[cond_case->code.expression_count - 1]);
//				case_expr->scope_type = BSLScope_cond;
//				case_expr->scope_level = brace_scope;
//				
//				if (curr->token != NULL) {
//					// store expression
//					bsl_token_check_scope_increase(&brace_scope, curr->token, BSLTokenCode_ctl_lbrace);
//					bsl_token_check_scope_decrease(&brace_scope, curr->token, BSLTokenCode_ctl_rbrace);
//				}
//				
//				if (case_expr->tokens == NULL) {
//					// watch out for this ownership!
//					case_expr->tokens = curr;
//				}
//				
//				// smart advancing to next ir item
//				if (found_brace == 1) {
//					uint32_t track = *index;
//					result = bsl_function_interp_expression_increment(&curr, interp, index);
//					
//					if (track != *index) {
//						cond_case->code.expression = realloc(cond_case->code.expression, sizeof(bsl_expression) * (cond_case->code.expression_count + 1));
//						cond_case->code.expression_count += 1;
//						
//						cond_case->code.expression[cond_case->code.expression_count - 1].scope_level = 0;
//						cond_case->code.expression[cond_case->code.expression_count - 1].scope_type = BSLScope_invalid;
//						cond_case->code.expression[cond_case->code.expression_count - 1].tokens = NULL;
//					}
//					
//				}
//				else {
//					if (curr->next == NULL) {
//						result = bsl_function_interp_expression_increment(&curr, interp, index);
//						
//						if (result == 0) {
//							
//							while (curr->token == NULL) {
//								result = bsl_function_interp_expression_increment(&curr, interp, index);
//								
//								if (result == -1) {
//									break;
//								}
//							}
//							
//							if (curr->token != NULL) {
//								if (curr->token->code == BSLTokenCode_id_else) {
//									// found else
//									found_else = 1;
//								}
//								else {
//									result = bsl_function_interp_expression_decrement(&curr, interp, index);
//									break;
//								}
//							}
//							else {
//								// error
//								break;
//							}
//						}
//						else {
//							break;
//						}
//					}
//					else {
//						curr = curr->next;
//					}
//				}
//			}
//			
//		}
//		
//		if (curr->token != NULL) {
//			// else (if) (optional) repeat parsing ^^^
//			if (curr->token->code == BSLTokenCode_id_else) {
//				bsl_function_interp_expression_increment(&curr, interp, index);
//				
//				if (curr->token->code != BSLTokenCode_id_if) {
//					bsl_function_interp_expression_decrement(&curr, interp, index);
//				}
//				
//				conditional.case_count += 1;
//				conditional.cond_case = realloc(conditional.cond_case, sizeof(bsl_statement_conditional_case) * (conditional.case_count));
//				goto if_loop;
//			}
//		}
		
	}
	
	// move current position
	*token = curr;
	
	return conditional;
}

int8_t bsl_conditional_evaluation(bsl_conditional *cond, bsl_context **context) {
	int8_t result = 0;
	
	
	
	return result;
}