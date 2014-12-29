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
					var_symbol->script = curr->token->offset.script;
					var_symbol->line = curr->token->offset.line;
					
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
					var_symbol->script = curr->token->offset.script;
					var_symbol->line = curr->token->offset.line;
					
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

bsl_context * bsl_evaluate_expression(bsl_expression *expr, bsl_context *context) {
	
	bsl_tkn_ir *curr = expr->tokens;
	
	while (curr != NULL) {
		bsl_token *token = curr->token;
		
		if (token != NULL) {
			char *token_name = calloc(token->offset.length + 1, sizeof(char));
			strncpy(token_name, token->contents, token->offset.length);
			
			bsl_symbol *symbol = bsl_db_get_global(token_name, context);
			if (symbol != NULL) {
				// global symbol
				context->stack->active->symbol = symbol;
				context->stack->active->next = bsl_stack_scope_create();
				context->stack->active = context->stack->active->next;
			}
			else {
				// check if in local state
				bsl_symbol *local_symbol = bsl_db_get_state(token_name, context);
				
				if (local_symbol != NULL) {
					
					if (curr->next != NULL) {
						
						if (curr->next->token != NULL) {
							
							if (curr->next->token->code == BSLTokenCode_op_assign) {
								// variable assignment
							}
						}
					}
				}
				else {
					// check if local variable, otherwise error
					bsl_variable local_variable = {0};
					
					if (strncmp(token_name, "var", sizeof(char[3])) == 0) {
						local_variable = bsl_variable_parse(&curr, context);
					}
				}
			}
		}
		
		curr = curr->next;
	}
	
	return context;
}