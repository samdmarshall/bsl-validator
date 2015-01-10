//
//  BSLEvaluate.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLEvaluate.h"
#include "BSLVariable.h"
#include "BSLFunction.h"
#include "BSLSymbol.h"
#include "BSLStack.h"
#include "BSLTokenDefinitions.h"
#include "BSLExecute.h"
#include "BSLStatement.h"

bsl_context * bsl_evaluate_ir(bsl_tkn_ir *token_ir, bsl_context *context) {
	bsl_tkn_ir *curr = token_ir;
	
	while (curr != NULL) {
		bsl_tkn_ir *item = curr;
		
		bsl_token *item_token = item->token;
		
		context = bsl_context_update(context, item_token);
		
		switch (context->curr_scope) {
			case BSLScope_global: {
				if (item_token->code == BSLTokenCode_id_var) {
					bsl_variable var = bsl_variable_parse(&item, context);
					
					bsl_symbol *var_symbol = bsl_symbol_create(bsl_symbol_type_variable);
					var_symbol->u.value = var;
					bsl_symbol_update_info(var_symbol, curr->token->offset);
					
					bsl_symbol *symbol_test = bsl_db_get_global(var_symbol->u.value.name, context);
					if (symbol_test == NULL) {
						bsl_db_register_global(var_symbol->u.value.name, var_symbol, context);
					}
					else {
						// error, already registered symbol
						context->error = bsl_error_registered_symbol;
					}
					
				}
				else if (item_token->code == BSLTokenCode_id_func) {
					bsl_function func = bsl_function_parse(&item, context);
					
					bsl_symbol *var_symbol = bsl_symbol_create(bsl_symbol_type_function);
					var_symbol->u.func = func;
					bsl_symbol_update_info(var_symbol, curr->token->offset);
					
					bsl_symbol *symbol_test = bsl_db_get_global(var_symbol->u.func.name, context);
					if (symbol_test == NULL) {
						bsl_db_register_global(var_symbol->u.func.name, var_symbol, context);
					}
					else {
						// error, already registered symbol
						context->error = bsl_error_registered_symbol;
					}
				}
				else {
					if (item_token->code == BSLTokenCode_id_comment) {
						// skip comments
						while (curr->token->code != BSLTokenCode_id_newline) {
							curr = curr->next;
						}
					}
					else if (item_token->code == BSLTokenCode_id_newline) {
						// skip newlines
					}
					else {
						if (item_token->offset.length > 0) {
							// error in script
							context->error = bsl_error_invalid_identifier;
						}
					}
				}
			}
			case BSLScope_func: {
//				break;
			}
			case BSLScope_cond: {
//				break;
			}
			default: {
//				break;
			}
		}
		
		if (item != NULL) {
			curr = item->next;
		}
		else {
			break;
		}
	}
	
	return context;
}
