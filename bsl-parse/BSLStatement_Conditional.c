//
//  BSLStatement_Conditional.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Conditional.h"
#include "BSLToken.h"

int bsl_function_interp_expression_increment(bsl_tkn_ir **token, bsl_function_interpreted interp, uint32_t *index) {
	
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
	}
	else {
		curr = curr->next;
	}
	
	*token = curr;
	
	return 0;
}

int bsl_function_interp_expression_decrement(bsl_tkn_ir **token, bsl_function_interpreted interp, uint32_t *index) {
	
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

bsl_statement_conditional bsl_statement_conditional_create(bsl_tkn_ir **token, bsl_context *context, bsl_function_interpreted interp, uint32_t *index) {
	bsl_statement_conditional conditional = {};
	
	bsl_tkn_ir *curr = *token;
	
	int result = 0;
	
	debug_printf("%s","conditional evaluation: ");
	
	// parse logic expression
	if (curr->token != NULL) { // check to make sure we have a token
		// check to make sure we still have the starting `if`
		if (curr->token->code == BSLTokenCode_id_if) {
			// advance to the next token
			curr = curr->next;
			
			// track the close scope
			int8_t scope_tracker = 0;
			// this token has to be an open parenthesis
			while (curr != NULL) {
				if (curr->token != NULL) {
					
					bsl_token_check_scope_increase(&scope_tracker, curr->token, BSLTokenCode_ctl_lparen);
					bsl_token_check_scope_decrease(&scope_tracker, curr->token, BSLTokenCode_ctl_rparen);
					
					// add ir to conditional
					
					if (scope_tracker == 0) {
						// end of scope, break from loop
						break;
					}
				}
				
				curr = curr->next;
			}
			
			if (scope_tracker != 0) {
				// error in scope of conditional
			}
			
		}
		else {
			// error
		}
	}
	
	// smart advancing past conditional to expressions
	result = bsl_function_interp_expression_increment(&curr, interp, index);
	
	if (curr->token != NULL) {
		// used to track if we only should read one expression or not
		int found_brace = 0;
		// tracking depth scope of braces
		int8_t brace_scope = 0;
		// check if using a encapsulating brace
		if (curr->token->code == BSLTokenCode_ctl_lbrace) {
			// found a brace, track scope and advance
			found_brace = 1;
			// increase brace scope
			brace_scope += 1;
			
			// smart advancing to next ir item
			result = bsl_function_interp_expression_increment(&curr, interp, index);
		}
		
		int8_t found_else = 0;
		while (brace_scope != 0 && result == 0) {
			
			if (curr->token != NULL) {
				// store expression
				bsl_token_check_scope_increase(&brace_scope, curr->token, BSLTokenCode_ctl_lbrace);
				bsl_token_check_scope_decrease(&brace_scope, curr->token, BSLTokenCode_ctl_rbrace);
			}
			
			// smart advancing to next ir item
			if (found_brace == 1) {
				result = bsl_function_interp_expression_increment(&curr, interp, index);
			}
			else {
				if (curr->next == NULL) {
					result = bsl_function_interp_expression_increment(&curr, interp, index);
					
					if (result == 0) {
						
						if (curr->token->code == BSLTokenCode_id_else) {
							// found else
							found_else = 1;
						}
						else {
							result = bsl_function_interp_expression_decrement(&curr, interp, index);
							break;
						}
					}
				}
				else {
					curr = curr->next;
				}
			}
		}
		
	}
	
	// logical statement
	
	// else (if) (optional) repeat parsing ^^^
	
	// move current position
	*token = curr;
	
	return conditional;
}