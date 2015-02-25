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
#include "BSLVariable.h"
#include "BSLSymbol.h"
#include "BSLOperation.h"
#include "BSLExecute.h"

bsl_statement_iterate bsl_statement_iterate_create(bsl_tkn_ir **token, bsl_context *context, bsl_interpreted_code interp, uint32_t *index)
{
	bsl_statement_iterate iterate = {0};

	bsl_tkn_ir *curr = *token;

	int result = 0;

	// advance token
	result = bsl_function_interp_expression_increment_token(&curr, interp, index);
	// checking if valid token advance
	if (result != 0) {
		bsl_context_assign_error(context, bsl_error_missing_identifier); // ERROR ASSIGNMENT
	}
	bsl_context_check_error(context);

	// 'over' identifier
	if (curr->token->code != BSLTokenCode_id_over) {
		bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
	}
	bsl_context_check_error(context);

	result = bsl_function_interp_expression_increment_token(&curr, interp, index);
	// checking if valid token advance
	if (result != 0) {
		bsl_context_assign_error(context, bsl_error_missing_identifier); // ERROR ASSIGNMENT
	}
	bsl_context_check_error(context);

	// variable identifier
	if (curr->token->code != BSLTokenCode_id_generic) {
		bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
	}
	else {
		char *name = calloc(1 + curr->token->offset.length, sizeof(char));
		strncpy(name, curr->token->contents, sizeof(char[curr->token->offset.length]));

		bsl_symbol *lookup_symbol = bsl_db_get_state(name, context);

		if (lookup_symbol != NULL) {

			if (lookup_symbol->type == bsl_symbol_type_variable) {

				bsl_variable *found_var = &(lookup_symbol->u.value);

				if (found_var->type == bsl_variable_int) {
					// found the passed variable
					iterate.passed_var = lookup_symbol;
				}
				else {

					bsl_context_assign_error(context, bsl_error_invalid_variable_type);
				}
			}
			else {
				bsl_context_assign_error(context, bsl_error_invalid_identifier); // ERROR ASSIGNMENT
			}
		}
	}
	bsl_context_check_error(context);

	result = bsl_function_interp_expression_increment_token(&curr, interp, index);
	// checking if valid token advance
	if (result != 0) {
		bsl_context_assign_error(context, bsl_error_missing_identifier); // ERROR ASSIGNMENT
	}
	bsl_context_check_error(context);

	// 'using' identifier
	if (curr->token->code != BSLTokenCode_id_using) {
		bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
	}
	bsl_context_check_error(context);

	result = bsl_function_interp_expression_increment_token(&curr, interp, index);
	// checking if valid token advance
	if (result != 0) {
		bsl_context_assign_error(context, bsl_error_missing_identifier); // ERROR ASSIGNMENT
	}
	bsl_context_check_error(context);

	// variable identifier
	if (curr->token->code != BSLTokenCode_id_generic) {
		bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
	}
	else {
		// create local variable
		bsl_variable *local_variable = bsl_variable_create_type(bsl_variable_int);
		local_variable->name = calloc(1 + curr->token->offset.length, sizeof(char));
		strncpy(local_variable->name, curr->token->contents, sizeof(char[curr->token->offset.length]));

		iterate.local_var = bsl_symbol_create(bsl_symbol_type_variable);
		iterate.local_var->u.value = *local_variable;
	}
	bsl_context_check_error(context);

	result = bsl_function_interp_expression_increment_token(&curr, interp, index);
	// checking if valid token advance
	if (result != 0) {
		bsl_context_assign_error(context, bsl_error_missing_identifier); // ERROR ASSIGNMENT
	}
	bsl_context_check_error(context);

	// scope { }
	if (curr->token->code == BSLTokenCode_ctl_lbrace) {
		// found start of function expressions

		iterate.code.expression = calloc(1, sizeof(bsl_expression));
		iterate.code.expression_count = 0;

		int8_t brace_scope = 0;

		bsl_token_check_scope_increase(context, &brace_scope, curr->token, BSLTokenCode_ctl_lbrace);

		result = bsl_function_interp_expression_increment_token(&curr, interp, index);
		// checking if valid token advance
		if (result != 0 || curr == NULL || curr->token == NULL) {
			bsl_context_assign_error(context, bsl_error_missing_identifier); // ERROR ASSIGNMENT
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

	// move current position
	*token = curr;

	return iterate;
}

void bsl_statement_iterate_action(bsl_context **context, bsl_statement *statement, bsl_script_offset offset)
{
	bsl_symbol_update_info(statement->u.iterate.local_var, offset);

	bsl_operation *op = calloc(1, sizeof(bsl_operation));
	op->action = bsl_operation_action_cmp_ge;

	op->left_side = calloc(1, sizeof(bsl_operation_statement));
	op->left_side->type = bsl_operation_statement_type_statement;
	op->left_side->u.sm.type = bsl_statement_type_var;
	op->left_side->u.sm.u.var.variable = statement->u.iterate.passed_var->u.value;

	op->right_side = calloc(1, sizeof(bsl_operation_statement));
	op->right_side->type = bsl_operation_statement_type_statement;
	op->right_side->u.sm.type = bsl_statement_type_var;
	op->right_side->u.sm.u.var.variable = statement->u.iterate.local_var->u.value;

	bsl_variable *iterator = &(op->right_side->u.sm.u.var.variable);
	bsl_variable *upper_bounds = &(op->left_side->u.sm.u.var.variable);
	bsl_variable *temp_variable = &(statement->u.iterate.local_var->u.value);

	// check to make sure we aren't corrupting current variable state
	char *temp_name = statement->u.iterate.local_var->u.value.name;

	bsl_symbol *lookup_symbol = bsl_db_get_state(temp_name, *context);

	if (lookup_symbol == NULL) {
		bsl_db_register_state(temp_name, statement->u.iterate.local_var, *context);

		debug_printf("\t%s \n{\n", "iterate");

		while (bsl_operation_evaluation(context, op) == 1) {

			debug_printf("\t\t [%s = %i of %i] {\n", iterator->name, iterator->u.i, upper_bounds->u.i);

			bsl_execute_interpreted_code(statement->u.iterate.code, context);

			iterator->u.i += 1;
			temp_variable->u.i = iterator->u.i;

			debug_printf("%s", "\t\t}\n");
		}

		debug_printf("%s", "}\n");

		bsl_db_register_state(temp_name, NULL, *context);
	}
	else {
		bsl_context_assign_error(*context, bsl_error_registered_symbol); // ERROR ASSIGNMENT
	}

	bsl_operation_statement_release(op->left_side);
	bsl_operation_statement_release(op->right_side);

	bsl_operation_release(op);
}
