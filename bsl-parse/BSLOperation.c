//
//  BSLOperation.c
//  bsl-parse
//
//  Created by Samantha Marshall on 1/14/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#include "BSLOperation.h"
#include "BSLParse.h"
#include "BSLStatement.h"
#include "BSLContext.h"
#include "BSLExecute.h"

// clang-format off

#define OperatorCompareCode(code, value, op) \
case code: { \
	if (op < value) { \
		op = value; \
		highest = index; \
	} \
	break; \
}


#define TokenToOperatorCode(type) \
case BSLTokenCode_ ## type : { \
	op->action = bsl_operation_action_ ## type ; \
	break; \
}

// clang-format on

int32_t bsl_operation_find_highest_operator_index(bsl_tkn_ir *cond_ir)
{
	int32_t op = -1;
	uint32_t index = -1;
	int32_t highest = -1;

	bsl_tkn_ir *curr = cond_ir;

	while (curr != NULL) {
		index++;

		// clang-format off
		switch (curr->token->code) {
			OperatorCompareCode(BSLTokenCode_op_AND, 20, op)
			OperatorCompareCode(BSLTokenCode_op_OR, 20, op)
			OperatorCompareCode(BSLTokenCode_op_NOT, 255, op)
			OperatorCompareCode(BSLTokenCode_cmp_eq, 10, op)
			OperatorCompareCode(BSLTokenCode_cmp_ne, 10, op)
			OperatorCompareCode(BSLTokenCode_cmp_lt, 10, op)
			OperatorCompareCode(BSLTokenCode_cmp_gt, 10, op)
			OperatorCompareCode(BSLTokenCode_cmp_le, 10, op)
			OperatorCompareCode(BSLTokenCode_cmp_ge, 10, op)
			default: {
				break;
			}
		}
		// clang-format on

		curr = curr->next;
	}

	return highest;
}

bsl_operation_statement *bsl_operation_parse_op_side(bsl_context *context, bsl_tkn_ir *token)
{

	bsl_interpreted_code code = {0};
	uint32_t index = 0;

	bsl_operation_statement *side = calloc(1, sizeof(bsl_operation_statement));
	int32_t is_op = bsl_operation_find_highest_operator_index(token);

	if (is_op == -1) {
		side->type = bsl_operation_statement_type_statement;
		side->u.sm = bsl_statement_parse(&token, context, code, &index);
	}
	else {
		side->type = bsl_operation_statement_type_operation;
		bsl_operation *parsed_op = bsl_operation_create(context, token);
		memcpy(&(side->u.op), parsed_op, sizeof(bsl_operation));
		bsl_operation_release(parsed_op);
	}

	return side;
}

bsl_operation *bsl_operation_create(bsl_context *context, bsl_tkn_ir *cond_ir)
{
	bsl_operation *op = calloc(1, sizeof(bsl_operation));

	if (op != NULL) {

		if (cond_ir != NULL) {
			// this is a conditional if

			bsl_tkn_ir *curr = cond_ir;

			int32_t token_count = 0;
			int32_t highest = bsl_operation_find_highest_operator_index(cond_ir);

			bsl_tkn_ir *left_side = NULL;

			while (curr != NULL && token_count < highest) {

				if (left_side == NULL) {
					left_side = bsl_token_ir_copy(curr);
				}
				else {
					bsl_token_ir_append(&left_side, curr);
				}

				token_count += 1;
				curr = curr->next;
			}

			if (left_side != NULL) {
				left_side = bsl_token_ir_jump_head(left_side);
			}

			if (curr == NULL) {
				bsl_context_assign_error(context, bsl_error_missing_identifier); // ERROR ASSIGNMENT
				return op;
			}

			if (curr->token == NULL) {
				bsl_context_assign_error(context, bsl_error_missing_identifier); // ERROR ASSIGNMENT
				return op;
			}

			// clang-format off
			switch (curr->token->code) {
				TokenToOperatorCode(cmp_eq)
				TokenToOperatorCode(cmp_ne)
				TokenToOperatorCode(cmp_lt)
				TokenToOperatorCode(cmp_gt)
				TokenToOperatorCode(cmp_le)
				TokenToOperatorCode(cmp_ge)
				TokenToOperatorCode(op_AND)
				TokenToOperatorCode(op_OR)
				TokenToOperatorCode(op_NOT)
				default: {
					break;
				}
			}
			// clang-format on

			bsl_tkn_ir *right_side = NULL;

			curr = curr->next;
			token_count = 0;

			int32_t remaining_count = bsl_token_ir_count(curr);

			while (curr != NULL && token_count < remaining_count) {

				if (right_side == NULL) {
					right_side = bsl_token_ir_copy(curr);
				}
				else {
					bsl_token_ir_append(&right_side, curr);
				}

				token_count += 1;
				curr = curr->next;
			}

			if (right_side != NULL) {
				right_side = bsl_token_ir_jump_head(right_side);
			}

			op->left_side = bsl_operation_parse_op_side(context, left_side);

			op->right_side = bsl_operation_parse_op_side(context, right_side);
		}
		else {
			// this is a terminating else
		}
	}

	return op;
}

int8_t bsl_operation_resolve_value(bsl_statement *statement, bsl_context **context, int *value)
{
	int8_t result = 0;

	bsl_variable *left_side_var = NULL;

	if (statement->type == bsl_statement_type_func) {
		bsl_function func = statement->u.func.function;
		bsl_symbol *symbol = bsl_db_get_state(func.name, *context);
		left_side_var = bsl_symbol_parse_call_symbol(context, symbol, func.rtype, func.args, func.arg_count);
	}
	else if (statement->type == bsl_statement_type_var) {
		left_side_var = &(statement->u.var.variable);
	}
	else {
		// error
		bsl_context_assign_error((*context), bsl_error_invalid_statement_in_conditional); // ERROR ASSIGNMENT
		return result;
	}

	if (left_side_var->type != bsl_variable_bool && left_side_var->type != bsl_variable_int) {
		// error
		bsl_context_assign_error((*context), bsl_error_invalid_variable_type); // ERROR ASSIGNMENT
		return result;
	}

	if (left_side_var->type == bsl_variable_bool) {
		*value = left_side_var->u.b;
	}

	if (left_side_var->type == bsl_variable_int) {
		*value = left_side_var->u.i;
	}

	return result;
}

int8_t bsl_operation_evaluation(bsl_context **context, bsl_operation *op)
{
	int8_t result = 0;

	int8_t is_two_statement = 0;
	int8_t is_two_sided = 0;

	if (op->left_side != NULL && op->right_side != NULL) {

		is_two_sided = 1;

		if (op->left_side->type == bsl_operation_statement_type_statement && op->right_side->type == bsl_operation_statement_type_statement) {

			is_two_statement = 1;
		}
	}

	int8_t is_logic = 0;

	switch (op->action) {
		case bsl_operation_action_op_AND:
		case bsl_operation_action_op_OR:
		case bsl_operation_action_op_NOT: {
			is_logic = 1;

			break;
		}
		default: {
			break;
		}
	}

	if (is_two_statement == 1 && is_logic != 1) {

		// ==================================
		// Left Side

		bsl_statement *left_side_statement = &(op->left_side->u.sm);
		int left_value = 0;

		result = bsl_operation_resolve_value(left_side_statement, context, &left_value);

		if (bsl_context_check_error(*context) != bsl_error_none) {
			return result;
		}

		// ==================================
		// Right Side

		bsl_statement *right_side_statement = &(op->right_side->u.sm);
		int right_value = 0;

		result = bsl_operation_resolve_value(right_side_statement, context, &right_value);

		if (bsl_context_check_error(*context) != bsl_error_none) {
			return result;
		}

		// ==================================
		// Compare

		switch (op->action) {
			case bsl_operation_action_cmp_lt: {
				if (left_value < right_value) {
					result = 1;
				}
				break;
			}
			case bsl_operation_action_cmp_le: {
				if (left_value <= right_value) {
					result = 1;
				}
				break;
			}
			case bsl_operation_action_cmp_eq: {
				if (left_value == right_value) {
					result = 1;
				}
				break;
			}
			case bsl_operation_action_cmp_ne: {
				if (left_value != right_value) {
					result = 1;
				}
				break;
			}
			case bsl_operation_action_cmp_ge: {
				if (left_value >= right_value) {
					result = 1;
				}
				break;
			}
			case bsl_operation_action_cmp_gt: {
				if (left_value > right_value) {
					result = 1;
				}
				break;
			}
			default: {
				break;
			}
		}
	}
	else if (is_logic == 1) {

		int8_t left_side = bsl_operation_evaluation(context, &(op->left_side->u.op));
		int8_t right_side = bsl_operation_evaluation(context, &(op->right_side->u.op));

		switch (op->action) {
			case bsl_operation_action_op_AND: {
				if (is_two_sided == 1) {
					if (left_side && right_side) {
						result = 1;
					}
				}
				break;
			}
			case bsl_operation_action_op_OR: {
				if (is_two_sided == 1) {
					if (left_side || right_side) {
						result = 1;
					}
				}
				break;
			}
			case bsl_operation_action_op_NOT: {
				if (is_two_sided == 0) {
					if (!right_side) {
						result = 1;
					}
				}
				break;
			}
			default: {
				break;
			}
		}
	}
	else {
		// error
		bsl_context_assign_error((*context), bsl_error_invalid_conditional); // ERROR ASSIGNMENT
	}

	return result;
}

void bsl_operation_release(bsl_operation *op)
{
	if (op != NULL) {

		free(op);
	}
}

void bsl_operation_statement_release(bsl_operation_statement *statement)
{
	if (statement != NULL) {

		free(statement);
	}
}
