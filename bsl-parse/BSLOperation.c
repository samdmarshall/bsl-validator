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

bsl_operation * bsl_operation_create(bsl_context *context, bsl_tkn_ir *cond_ir) {
	bsl_operation *op = calloc(1, sizeof(bsl_operation));
	
	if (op != NULL) {
		
		if (cond_ir != NULL) {
			// this is a conditional if
			
			uint32_t token_count = 0;
			
			if (cond_ir->token->code == BSLTokenCode_op_NOT) {
				op->action = bsl_operation_action_act_not;
				
				cond_ir = cond_ir->next;
			}
			
			token_count = bsl_token_ir_count(cond_ir);
			
			uint32_t index = 0;
			bsl_interpreted_code code = {0};
			
			if (op->action == bsl_operation_action_act_not) {
				op->statement_r = bsl_statement_parse(&cond_ir, context, code, &index);
			}
			else {
				op->statement_l = bsl_statement_parse(&cond_ir, context, code, &index);
				
				// add debug logging for operation type
				switch (cond_ir->token->code) {
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
				
				cond_ir = cond_ir->next;
				
				op->statement_r = bsl_statement_parse(&cond_ir, context, code, &index);
				
			}
			
			uint32_t remaining_count = bsl_token_ir_count(cond_ir);
		
			printf("");
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