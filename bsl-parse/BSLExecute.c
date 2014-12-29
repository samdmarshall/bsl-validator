//
//  BSLExecute.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLExecute.h"
#include "BSLContext.h"
#include "BSLEvaluate.h"

int bsl_execute_symbol(char *name, bsl_context *context) {
	int result = 0;
	
	bsl_symbol *symbol = bsl_db_get_global(name, context);
	if (symbol != NULL) {
		if (symbol->type == bsl_symbol_type_function) {
			// setup state
			
			
			// run expressions
			for (uint32_t index = 0; index < symbol->u.func.u.interp.expression_count; index++) {
				bsl_expression expression = symbol->u.func.u.interp.expression[index];
				if (expression.tokens->token != NULL) {
					context = bsl_evaluate_expression(&expression, context);
					
					if (bsl_context_check_error(context) != bsl_error_none) {
						result = -1;
						break;
					}
				}
			}
			
		}
	}
	else {
		// could not locate symbol
		result = -1;
	}
	
	return result;
}