//
//  BSLExpression.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLExpression.h"

bsl_expression * bsl_expression_create(bsl_context *context) {
	bsl_expression *expression = calloc(1, sizeof(bsl_expression));
	
	if (expression != NULL) {
		expression->tokens = calloc(1, sizeof(bsl_tkn_ir));
		
		expression->scope_type = context->curr_scope;
		expression->scope_level = 0;
	}
	
	return expression;
}

void bsl_expression_release(bsl_expression *expression) {
	if (expression->tokens != NULL) {
		free(expression->tokens);
	}
	if (expression != NULL) {
		free(expression);
	}
}

bsl_expression * bsl_expression_parse(bsl_tkn_ir **item, bsl_context *context) {
	bsl_expression *expression = NULL;
	
	bsl_tkn_ir *curr = (*item);
	if (curr != NULL) {
		
		expression = bsl_expression_create(context);
		bsl_tkn_ir *expr_curr = expression->tokens;
		bsl_tkn_ir *expr_prev = NULL;
		
		// end of expression when encountering any breaking behavior
		while (curr->token->code != BSLTokenCode_ctl_semicolon && curr->token->code != BSLTokenCode_id_newline && curr->token->code != BSLTokenCode_id_comment) {
			
			if (expr_curr->token == NULL) {
				expr_curr->token = calloc(1, sizeof(bsl_token));
			}
			memcpy(expr_curr->token, curr->token, sizeof(bsl_token));
			
			if (curr->next == NULL) {
				break;
			}
			else {
				if (curr->next->token->code != BSLTokenCode_ctl_semicolon && curr->next->token->code != BSLTokenCode_id_newline && curr->next->token->code != BSLTokenCode_id_comment) {
					expr_curr->next = calloc(1, sizeof(bsl_tkn_ir));
				}
				else {
					expr_curr->next = NULL;
				}
				
				expr_curr->prev = expr_prev;
				
				expr_prev = expr_curr;
				expr_curr = expr_curr->next;
				
				curr = curr->next;
			}
		}
	}
	
	*item = curr;
	
	return expression;
}