//
//  BSLExpression.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLExpression.h"
#include "BSLContext.h"
#include "BSLToken.h"

bsl_expression *bsl_expression_create(bsl_context *context)
{
	bsl_expression *expression = calloc(1, sizeof(bsl_expression));

	if (expression != NULL) {
		expression->tokens = calloc(1, sizeof(bsl_tkn_ir));

		expression->scope_type = context->curr_scope;
		expression->scope_level = 0;
	}

	return expression;
}

void bsl_expression_release(bsl_expression *expression)
{
	if (expression->tokens != NULL) {
		free(expression->tokens);
	}
	if (expression != NULL) {
		free(expression);
	}
}

int bsl_expression_check_end(bsl_token_code code)
{
	switch (code) {
		case BSLTokenCode_ctl_semicolon:
		case BSLTokenCode_id_newline:
		case BSLTokenCode_id_comment: {
			return 1;
		}
		default: {
			return 0;
		}
	}
}

int bsl_expression_check_control(bsl_token_code code)
{
	switch (code) {
		case BSLTokenCode_ctl_semicolon:
		case BSLTokenCode_id_newline:
		case BSLTokenCode_id_comment:
		case BSLTokenCode_ctl_lbrace:
		case BSLTokenCode_ctl_rbrace: {
			return 1;
		}
		default: {
			return 0;
		}
	}
}

bsl_expression *bsl_expression_parse(bsl_tkn_ir **item, bsl_context *context)
{
	bsl_expression *expression = NULL;

	bsl_tkn_ir *curr = (*item);
	if (curr != NULL) {

		expression = bsl_expression_create(context);
		bsl_tkn_ir *expr_curr = expression->tokens;
		bsl_tkn_ir *expr_prev = NULL;

		bsl_tkn_ir *initial = NULL;

		int expression_end = 0;
		int8_t identifier_counter = 0;
		int8_t paren_counter = 0;

		// end of expression when encountering any breaking behavior
		while (expression_end != 1) {

			expression_end = bsl_expression_check_control(curr->token->code);
			if (expression_end != 1) {
				if (initial == NULL) {
					initial = curr;
				}

				if (expr_curr->token == NULL) {
					expr_curr->token = calloc(1, sizeof(bsl_token));
				}
				memcpy(expr_curr->token, curr->token, sizeof(bsl_token));

				int next = 0;

				if (initial->token->code != BSLTokenCode_id_if && initial->token->code != BSLTokenCode_id_iterate) {

					next = bsl_expression_check_end(curr->next->token->code);
				}
				else {

					if (initial->token->code == BSLTokenCode_id_if) {
						bsl_token_check_scope_increase(context, &paren_counter, curr->token, BSLTokenCode_ctl_lparen);
						bsl_token_check_scope_decrease(context, &paren_counter, curr->token, BSLTokenCode_ctl_rparen);

						if (paren_counter == 0 && initial != curr) {
							next = 1;
						}
					}

					if (initial->token->code == BSLTokenCode_id_iterate) {
						if (identifier_counter == 4 && initial != curr) {
							next = 1;
						}
						else {
							identifier_counter++;
						}
					}
				}
				
				expr_curr->prev = expr_prev;
				expr_prev = expr_curr;
				
				if (next == 0) {
					expr_curr->next = calloc(1, sizeof(bsl_tkn_ir));
				}
				else {
					expr_curr->next = NULL;
					expression_end = next;
					continue;
				}

				expr_curr = expr_curr->next;

				curr = curr->next;
			}
			else {
				if (curr->token->code == BSLTokenCode_ctl_lbrace || curr->token->code == BSLTokenCode_ctl_rbrace) {
					if (expr_curr->token == NULL) {
						expr_curr->token = calloc(1, sizeof(bsl_token));
					}
					memcpy(expr_curr->token, curr->token, sizeof(bsl_token));
				}
			}
		}
	}

	*item = curr;

	return expression;
}