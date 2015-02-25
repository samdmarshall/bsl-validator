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
#include "BSLOperation.h"
#include "BSLParse.h"
#include "BSLExecute.h"

bsl_statement_conditional bsl_statement_conditional_create(bsl_tkn_ir **token, bsl_context *context, bsl_interpreted_code interp, uint32_t *index)
{
	bsl_statement_conditional conditional = {0};
	conditional.cond_case = calloc(1, sizeof(bsl_statement_conditional_case));
	conditional.case_count = 1;

	bsl_tkn_ir *curr = *token;

	debug_printf("%s", "conditional evaluation:\n");

// clang-format off
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
				context->error = bsl_error_token_invalid_syntax; // ERROR ASSIGNMENT
			}
		}
		
		result = bsl_function_interp_expression_increment(&curr, interp, index);
		
		// tracking tokens
		bsl_tkn_ir *cond_tokens = NULL;
		
		// track the close scope
		int8_t scope_tracker = 0;
		
		while (curr != NULL && result == 0) {
			
			int8_t pre_check = scope_tracker;
			
			if (curr->token != NULL) {
				bsl_token_check_scope_increase(context, &scope_tracker, curr->token, BSLTokenCode_ctl_lparen);
				bsl_token_check_scope_decrease(context, &scope_tracker, curr->token, BSLTokenCode_ctl_rparen);
			}
			
			// add ir to conditional
			if (pre_check >= 1 && scope_tracker != 0) {
				if (cond_tokens == NULL) {
					cond_tokens = bsl_token_ir_copy(curr);
				}
				else {
					bsl_token_ir_append(&cond_tokens, curr);
				}
				
			}
			
			if (scope_tracker == 0) {
				// end of scope, break from loop
				break;
			}

			curr = curr->next;
		}
		
		// reset position of ir tokens to use in conditional
		cond_tokens = bsl_token_ir_jump_head(cond_tokens);
		
		// parse conditional tokens to operation
		cond_case->cond->op = bsl_operation_create(context, cond_tokens);

		// smart advancing past conditional to expressions
		result = bsl_function_interp_expression_increment_token(&curr, interp, index);
		
		// used to track if we only should read one expression or not
		int8_t found_brace = 0;
		// tracking depth scope of braces
		int8_t brace_scope = 0;
		
		if (curr->token->code == BSLTokenCode_ctl_lbrace) {
			bsl_token_check_scope_increase(context, &brace_scope, curr->token, BSLTokenCode_ctl_lbrace);
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
				bsl_token_check_scope_increase(context, &brace_scope, curr->token, BSLTokenCode_ctl_lbrace);
				bsl_token_check_scope_decrease(context, &brace_scope, curr->token, BSLTokenCode_ctl_rbrace);
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
					
					if (result == 0 && curr->token != NULL) {
						
						if (curr->token->code == BSLTokenCode_id_else) {
							found_else = 1;
							
							// check for next if
							result = bsl_function_interp_expression_increment_token(&curr, interp, index);
							if (result != 0) {
								printf("");
							}
							
							if (curr->token->code != BSLTokenCode_id_if) {
								
								result = bsl_function_interp_expression_decrement_token(&curr, interp, index);
								if (result != 0) {
									printf("");
								}
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

	// clang-format on

	// move current position
	*token = curr;

	return conditional;
}

int8_t bsl_conditional_evaluation(bsl_conditional *cond, bsl_context **context)
{
	int8_t result = 0;

	switch (cond->type) {
		case bsl_conditional_type_if: {
			// evaluate operation
			result = bsl_operation_evaluation(context, cond->op);

			break;
		}
		case bsl_conditional_type_else: {
			result = 1;

			break;
		}
		default: {
			// error
			(*context)->error = bsl_error_invalid_conditional; // ERROR ASSIGNMENT
			break;
		}
	}

	return result;
}

void bsl_statement_conditional_action(bsl_context **context, bsl_statement *statement, bsl_script_offset offset)
{
	ATR(unused) bsl_script_offset local_offset = offset;
	debug_printf("%s", "\t{\n");

	int8_t *case_eval = calloc(statement->u.conditional.case_count, sizeof(int8_t));
	for (int8_t eval_index = 0; eval_index < statement->u.conditional.case_count; eval_index++) {
		bsl_statement_conditional_case cond_case = statement->u.conditional.cond_case[eval_index];

		case_eval[eval_index] = bsl_conditional_evaluation(cond_case.cond, context);
	}

	for (int8_t exec_index = 0; exec_index < statement->u.conditional.case_count; exec_index++) {

		if (case_eval[exec_index] == 1) {

			bsl_execute_interpreted_code(statement->u.conditional.cond_case[exec_index].code, context);

			break;
		}
	}

	free(case_eval);

	debug_printf("%s", "\t}\n");
}