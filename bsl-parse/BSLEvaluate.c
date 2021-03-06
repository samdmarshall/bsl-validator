//
//  BSLEvaluate.c
//  bsl-parse
//
//  Created by Samantha Marshall on 12/27/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#include "BSLEvaluate.h"
#include "BSLVariable.h"
#include "BSLFunction.h"
#include "BSLSymbol.h"
#include "BSLStack.h"
#include "BSLTokenDefinitions.h"
#include "BSLExecute.h"
#include "BSLStatement.h"

bsl_context *bsl_evaluate_ir(bsl_tkn_ir *token_ir, bsl_context *context)
{
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
						bsl_context_assign_error(context, bsl_error_registered_symbol); // ERROR ASSIGNMENT
						bsl_symbol_duplicate_description(var_symbol, symbol_test);
					}
				}
				else if (item_token->code == BSLTokenCode_id_func) {
					bsl_function func = bsl_function_parse(&item, context);

					bsl_symbol *func_symbol = bsl_symbol_create(bsl_symbol_type_function);
					func_symbol->u.func = func;
					bsl_symbol_update_info(func_symbol, curr->token->offset);

					bsl_symbol *symbol_test = bsl_db_get_global(func_symbol->u.func.name, context);
					if (symbol_test == NULL) {
						bsl_db_register_global(func_symbol->u.func.name, func_symbol, context);
					}
					else {
						// error, already registered symbol
						bsl_context_assign_error(context, bsl_error_registered_symbol); // ERROR ASSIGNMENT
						bsl_symbol_duplicate_description(func_symbol, symbol_test);
					}
				}
				else {
					if (item_token->code == BSLTokenCode_id_comment) {
						// skip comments
						while (curr->token->code != BSLTokenCode_id_newline) {
							curr = curr->next;
							// check to ensure that
							if (curr == NULL) {
								break;
							}
						}
					}
					else if (item_token->code == BSLTokenCode_id_newline) {
						// skip newlines
					}
					else {
						if (item_token->offset.length > 0) {
							// error in script
							bsl_context_assign_error(context, bsl_error_invalid_identifier); // ERROR ASSIGNMENT
						}
					}
				}
				break;
			}
			case BSLScope_func: {
				bsl_context_assign_error(context, bsl_error_invalid_scope); // ERROR ASSIGNMENT
				break;
			}
			case BSLScope_cond: {
				bsl_context_assign_error(context, bsl_error_invalid_scope); // ERROR ASSIGNMENT
				break;
			}
			default: {
				break;
			}
		}

		if (bsl_context_check_error(context) != bsl_error_none) {
			break; // ERROR ASSIGNMENT
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
