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
			
			int32_t highest = bsl_operation_find_highest_operator_index(cond_ir);
			
			int32_t token_count = 0;
			int32_t scan_count = (highest != -1 ? highest : bsl_token_ir_count(curr));
			
			while (curr != NULL && token_count < scan_count) {
				
				if (op->left_side == NULL) {
					op->left_side = bsl_token_ir_copy(curr);
				}
				else {
					bsl_token_ir_append(&op->left_side, curr);
				}
				
				token_count += 1;
				curr = curr->next;
			}
			
			if (op->left_side != NULL) {
				bsl_token_ir_jump_head(op->left_side);
			}
			
			if (highest != -1) {
				
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
				
				// advance past operator
				curr = curr->next;
				token_count = 0;
				
				int32_t remaining_count = bsl_token_ir_count(curr);
				
				while (curr != NULL && token_count < remaining_count) {
					
					if (op->right_side == NULL) {
						op->right_side = bsl_token_ir_copy(curr);
					}
					else {
						bsl_token_ir_append(&op->right_side, curr);
					}
					
					token_count += 1;
					curr = curr->next;
				}
				
			}

		}
		else {
			// this is a terminating else
			
			printf("");
		}
		
	}
	
	return op;
}

void bsl_operation_release(bsl_operation *op) {
	if (op != NULL) {
		
		
		free(op);
	}
}