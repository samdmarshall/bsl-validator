//
//  BSLStatement_Iterate.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Iterate.h"
#include "BSLContext.h"
#include "BSLExpression.h"
#include "BSLStatement.h"
#include "BSLToken.h"
#include "BSLParse.h"

bsl_statement_iterate bsl_statement_iterate_create(bsl_tkn_ir **token, bsl_context *context, bsl_interpreted_code interp, uint32_t *index)
{
	bsl_statement_iterate iterate = {};

	bsl_tkn_ir *curr = *token;

	debug_printf("%s", "iterate: \n\t{\n");

	int result = 0;

	result = bsl_function_interp_expression_increment_token(&curr, interp, index);

	// 'over' identifier
	if (curr->token->code != BSLTokenCode_id_over) {
		context->error = bsl_error_token_invalid_syntax; // ERROR ASSIGNMENT
	}

	bsl_context_check_error(context);

	result = bsl_function_interp_expression_increment_token(&curr, interp, index);

	// variable identifier
	if (curr->token->code != BSLTokenCode_id_generic) {
		context->error = bsl_error_token_invalid_syntax; // ERROR ASSIGNMENT
	}

	bsl_context_check_error(context);

	result = bsl_function_interp_expression_increment_token(&curr, interp, index);

	// 'using' identifier
	if (curr->token->code != BSLTokenCode_id_using) {
		context->error = bsl_error_token_invalid_syntax; // ERROR ASSIGNMENT
	}

	bsl_context_check_error(context);

	result = bsl_function_interp_expression_increment_token(&curr, interp, index);

	// variable identifier
	if (curr->token->code != BSLTokenCode_id_generic) {
		context->error = bsl_error_token_invalid_syntax; // ERROR ASSIGNMENT
	}

	bsl_context_check_error(context);

	result = bsl_function_interp_expression_increment_token(&curr, interp, index);

	// scope { }
	if (curr->token->code == BSLTokenCode_ctl_lbrace) {
		// found start of function expressions

		iterate.code.expression = calloc(1, sizeof(bsl_expression));
		iterate.code.expression_count = 0;

		int8_t brace_scope = 0;

		bsl_token_check_scope_increase(context, &brace_scope, curr->token, BSLTokenCode_ctl_lbrace);

		result = bsl_function_interp_expression_increment_token(&curr, interp, index);

		if (curr == NULL || curr->token == NULL) {
			context->error = bsl_error_missing_identifier; // ERROR ASSIGNMENT
			return iterate;
		}

		bsl_context_check_error(context);

		while (brace_scope != 0) {
			if (curr->token != NULL) {
				bsl_token_check_scope_increase(context, &brace_scope, curr->token, BSLTokenCode_ctl_lbrace);
				bsl_token_check_scope_decrease(context, &brace_scope, curr->token, BSLTokenCode_ctl_rbrace);
			}

			if (brace_scope == 0) {
				break;
			}

			bsl_expression *expression = &(interp.expression[*index]);

			if (expression->tokens->token != NULL) {

				iterate.code.expression = realloc(iterate.code.expression, sizeof(bsl_expression) * (iterate.code.expression_count + 1));
				memcpy(&(iterate.code.expression[iterate.code.expression_count]), expression, sizeof(bsl_expression));
				iterate.code.expression_count += 1;
			}

			(*index)++;

			curr = interp.expression[(*index)].tokens;
		}
	}

	debug_printf("%s", "\t}\n");

	// move current position
	*token = curr;

	return iterate;
}