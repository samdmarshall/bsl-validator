//
//  BSLStatement.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/29/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLStatement.h"
#include "BSLTokenDefinitions.h"
#include "BSLVariable.h"
#include "BSLFunction.h"

bsl_statement bsl_statement_parse(bsl_tkn_ir **item, bsl_context *context) {
	bsl_statement expr = {0};
	
	bsl_tkn_ir *curr = (*item);
	
	printf("evaluate expression\n");
	bsl_token_code code = bsl_token_resolve_identifier(curr->token);
	
	switch (code) {
		case BSLTokenCode_id_schedule: {
			expr.type = bsl_statement_type_schedule;
			break;
		}
		case BSLTokenCode_id_iterate: {
			expr.type = bsl_statement_type_iterate;
			break;
		}
		case BSLTokenCode_id_return: {
			expr.type = bsl_statement_type_return;
			break;
		}
		case BSLTokenCode_id_sleep: {
			expr.type = bsl_statement_type_sleep;
			
			if (curr->next == NULL) {
				// parse error
			}
			
			// advance to sleep value
			curr = curr->next;
			
			if (curr->token->code == BSLTokenCode_id_int || curr->token->code == BSLTokenCode_type_int) {
				bsl_variable *sleep_time = bsl_variable_create_from_token(curr->token, context);
				
				if (sleep_time != NULL) {
					
					if (sleep_time->type == bsl_variable_int) {
						int time_val = sleep_time->u.i/60;
						
						sleep(time_val);
					}
					else {
						// error
					}
					
					bsl_variable_release(*sleep_time);
				}
				
			}
			else {
				// there is an error in parsing
			}
			
			break;
		}
		case BSLTokenCode_id_fork: {
			expr.type = bsl_statement_type_fork;
			
			if (curr->next == NULL) {
				// error
			}
			
			curr = curr->next;
			
			bsl_function function = bsl_function_parse(&curr, context);
			
			// do function
			
			bsl_function_release(function);
			
			break;
		}
		case BSLTokenCode_id_if: {
			expr.type = bsl_statement_type_conditional;
			break;
		}
		default: {
			// error
			break;
		}
	}
	
	return expr;
}