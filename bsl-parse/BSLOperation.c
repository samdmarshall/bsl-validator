//
//  BSLOperation.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/14/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLOperation.h"
#include "BSLParse.h"
#include "BSLStatement.h"
#include "BSLContext.h"
#include "BSLExecute.h"

#define OperatorCompareCode(code, value, op) \
case code: { \
	if (op < value) { \
		op = value; \
		highest = index; \
	} \
	break; \
}


int32_t bsl_operation_find_highest_operator_index(bsl_tkn_ir *cond_ir) {
	int32_t op = -1;
	uint32_t index = -1;
	int32_t highest = -1;
	
	bsl_tkn_ir *curr = cond_ir;
	
	while (curr != NULL) {
		index++;
		
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
		
		curr = curr->next;
	}
	
	return highest;
}

bsl_operation * bsl_operation_create(bsl_context *context, bsl_tkn_ir *cond_ir) {
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
			
			switch (curr->token->code) {
				case BSLTokenCode_cmp_eq: {
					op->action = bsl_operation_action_cmp_eq;
					break;
				}
				case BSLTokenCode_cmp_ne: {
					op->action = bsl_operation_action_cmp_ne;
					break;
				}
				case BSLTokenCode_cmp_lt: {
					op->action = bsl_operation_action_cmp_lt;
					break;
				}
				case BSLTokenCode_cmp_gt: {
					op->action = bsl_operation_action_cmp_gt;
					break;
				}
				case BSLTokenCode_cmp_le: {
					op->action = bsl_operation_action_cmp_le;
					break;
				}
				case BSLTokenCode_cmp_ge: {
					op->action = bsl_operation_action_cmp_ge;
					break;
				}
				default: {
					break;
				}
			}

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
			
			bsl_interpreted_code code = {0};
			uint32_t index = 0;
			
			op->left_side = calloc(1, sizeof(bsl_operation_statement));
			int32_t is_ls_op = bsl_operation_find_highest_operator_index(left_side);
			
			if (is_ls_op == -1) {
				op->left_side->type = bsl_operation_statement_type_statement;
				op->left_side->u.sm = bsl_statement_parse(&left_side, context, code, &index);
			}
			else {
				op->left_side->type = bsl_operation_statement_type_operation;
				bsl_operation *parsed_op = bsl_operation_create(context, left_side);
				memcpy(&(op->left_side->u.op), parsed_op, sizeof(bsl_operation));
			}
			
			op->right_side = calloc(1, sizeof(bsl_operation_statement));
			int32_t is_rs_op = bsl_operation_find_highest_operator_index(right_side);
			
			if (is_rs_op == -1) {
				op->right_side->type = bsl_operation_statement_type_statement;
				op->right_side->u.sm = bsl_statement_parse(&right_side, context, code, &index);
			}
			else {
				op->right_side->type = bsl_operation_statement_type_operation;
				bsl_operation *parsed_op = bsl_operation_create(context, right_side);
				memcpy(&(op->right_side->u.op), parsed_op, sizeof(bsl_operation));
			}

		}
		else {
			// this is a terminating else
			
			printf("");
		}
		
	}
	
	return op;
}

int8_t bsl_operation_evaluation(bsl_context **context, bsl_operation *op) {
	int8_t result = 0;
	
	
	if (op->left_side->type == bsl_operation_statement_type_statement && op->right_side->type == bsl_operation_statement_type_statement) {
		
		// ==================================
		// Left Side
		
		bsl_statement *left_side_statement = &(op->left_side->u.sm);
		bsl_variable *left_side_var = NULL;
		
		if (left_side_statement->type == bsl_statement_type_func) {
			bsl_function func = left_side_statement->u.func.function;
			bsl_symbol *symbol = bsl_db_get_state(func.name, *context);
			left_side_var = bsl_symbol_parse_call_symbol(context, symbol, func.rtype, func.args, func.arg_count);
		}
		else if (left_side_statement->type == bsl_statement_type_var) {
			left_side_var = &(left_side_statement->u.var.variable);
		}
		else {
			// error
			(*context)->error = bsl_error_invalid_statement_in_conditional;
			return result;
		}
		
		if (left_side_var->type != bsl_variable_bool && left_side_var->type != bsl_variable_int) {
			// error
			(*context)->error = bsl_error_invalid_variable_type_in_conditional;
			return result;
		}
		
		int left_value = 0;
		
		if (left_side_var->type == bsl_variable_bool) {
			left_value = left_side_var->u.b;
		}
		
		if (left_side_var->type == bsl_variable_int) {
			left_value = left_side_var->u.i;
		}
		
		// ==================================
		// Right Side
		
		bsl_statement *right_side_statement = &(op->right_side->u.sm);
		bsl_variable *right_side_var = NULL;
		
		if (right_side_statement->type == bsl_statement_type_func) {
			bsl_function func = right_side_statement->u.func.function;
			bsl_symbol *symbol = bsl_db_get_state(func.name, *context);
			right_side_var = bsl_symbol_parse_call_symbol(context, symbol, func.rtype, func.args, func.arg_count);
		}
		else if (right_side_statement->type == bsl_statement_type_var) {
			right_side_var = &(right_side_statement->u.var.variable);
		}
		else {
			// error
			(*context)->error = bsl_error_invalid_statement_in_conditional;
			return result;
		}
		
		if (right_side_var->type != bsl_variable_bool && right_side_var->type != bsl_variable_int) {
			// error
			(*context)->error = bsl_error_invalid_variable_type_in_conditional;
			return result;
		}
		
		int right_value = 0;
		
		if (right_side_var->type == bsl_variable_bool) {
			right_value = right_side_var->u.b;
		}
		
		if (right_side_var->type == bsl_variable_int) {
			right_value = right_side_var->u.i;
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
	else {
		
		
		switch (op->action) {
				
			case bsl_operation_action_act_and: {
				
				break;
			}
			case bsl_operation_action_act_or: {
				
				break;
			}
			case bsl_operation_action_act_not: {
				
				break;
			}
			default: {
				break;
			}
		}
	}
	
	return result;
}

void bsl_operation_release(bsl_operation *op) {
	if (op != NULL) {
		
		
		free(op);
	}
}