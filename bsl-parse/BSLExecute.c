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
#include "BSLVariable.h"
#include "BSLStatement.h"
#include "BSLSymbol.h"
#include "BSLStack.h"

int bsl_symbol_execute(char *name, bsl_context *context) {
	int result = 0;
	
	bsl_symbol *symbol = bsl_db_get_global(name, context);
	if (symbol != NULL) {
		if (symbol->type == bsl_symbol_type_function) {
			// setup state
			
			context->stack->active->symbol = symbol;
			
			context->stack->active->scope_level	= BSLScope_func;
			context->stack->active->scope_depth++;
			
			bsl_symbol_parse_call(&context, symbol->u.func.rtype, symbol->u.func.args, symbol->u.func.arg_count);
			
		}
	}
	else {
		// could not locate symbol
		result = -1;
	}
	
	return result;
}

int bsl_symbol_parse_evaluate_symbol(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) {
	debug_printf("%s(",symbol->u.func.name);
	
	int mismatch_arg = 0;
	
	for (uint32_t param_index = 0; param_index < symbol->u.func.arg_count; param_index++) {
		int8_t matched_type = 0;
		
		debug_printf("%s","[");
		
		for (uint32_t type_index = 0; type_index < symbol->u.func.args[param_index].arg_type_count; type_index++) {
			
			bsl_variable var = symbol->u.func.args[param_index].args[type_index];
			bsl_variable_type var_type = var.type;
			char *var_name = var.name;
			
			debug_printf("%s:%s", var_name, bsl_variable_get_type_name(var_type));
			
			if (type_index + 1 < symbol->u.func.args[param_index].arg_type_count) {
				debug_printf("%s"," | ");
			}
			
			if (args[param_index].arg_type_count > 0) {
				switch (var_type) {
					case bsl_variable_int: {
						matched_type = (args[param_index].args[0].type == bsl_variable_int || args[param_index].args[0].type == bsl_variable_bool || args[param_index].args[0].type == bsl_variable_float ? 1 : 0);
						break;
					}
					case bsl_variable_float: {
						matched_type = (args[param_index].args[0].type == bsl_variable_int || args[param_index].args[0].type == bsl_variable_float ? 1 : 0);
						break;
					}
					case bsl_variable_bool: {
						matched_type = (args[param_index].args[0].type == bsl_variable_int || args[param_index].args[0].type == bsl_variable_bool ? 1 : 0);
						break;
					}
					case bsl_variable_string: {
						matched_type = (args[param_index].args[0].type == bsl_variable_string ? 1 : 0);
						break;
					}
					default: {
						break;
					}
				}
			}
			else {
				matched_type = 2;
			}
		}
		
		debug_printf("%s","] = ");
		
		// this is error checking for passed arguments
		switch (matched_type) {
			case 0: {
				// not matched!
				mismatch_arg++;
				break;
			}
			case 1: {
				// add checks for compatible types and convert them before evaluating
				
				// matched!
				if (param_index < arg_count) {
					switch (args[param_index].args[0].type) {
						case bsl_variable_int: {
							debug_printf("%i",args[param_index].args[0].u.i);
							break;
						}
						case bsl_variable_bool: {
							debug_printf("%i",args[param_index].args[0].u.b);
							break;
						}
						case bsl_variable_float: {
							debug_printf("%f",args[param_index].args[0].u.f);
							break;
						}
						case bsl_variable_string: {
							debug_printf("%s",args[param_index].args[0].u.s);
							break;
						}
						case bsl_variable_None: {
							debug_printf("%s","void");
							break;
						}
						default: {
							// error
							break;
						}
					}
				}
				break;
			}
			case 2: {
				// null passed
				debug_printf("%s","NULL");
				break;
			}
			default: {
				break;
			}
		}
		
		if (param_index + 1 < symbol->u.func.arg_count) {
			debug_printf("%s",", ");
		}
		
	}
	
	debug_printf("%s",")");
	
	return mismatch_arg;
}

int bsl_symbol_parse_evaluate(bsl_context **context, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) {
	return bsl_symbol_parse_evaluate_symbol(context, (*context)->stack->active->symbol, rtype, args, arg_count);
}

void bsl_execute_interpreted_code(bsl_interpreted_code code, bsl_context **context) {
	
	bsl_context *tmp = (*context);
	
	uint32_t index = 0;
	
	while (index < code.expression_count) {
		bsl_expression expr = code.expression[index];
		
		bsl_tkn_ir *curr = expr.tokens;
		
		if (curr->token != NULL) {
			
			bsl_statement statement = bsl_statement_parse(&curr, tmp, code, &index);
			
			bsl_symbol *expr_statement = bsl_symbol_create(bsl_symbol_type_statement);
			expr_statement->u.expr = statement;
			bsl_symbol_update_info(expr_statement, expr.tokens->token->offset);
			
			tmp->stack->active->symbol = expr_statement;
			
			bsl_scope_type type = BSLScope_invalid;
			uint8_t depth = tmp->stack->active->scope_depth;
			
			switch (statement.type) {
				case bsl_statement_type_conditional: {
					type = BSLScope_cond;
					break;
				}
				case bsl_statement_type_sleep: {
					type = tmp->stack->active->scope_level;
					break;
				}
				case bsl_statement_type_fork: {
					type = tmp->stack->active->scope_level;
					break;
				}
				case bsl_statement_type_schedule: {
					type = tmp->stack->active->scope_level;
					break;
				}
				case bsl_statement_type_iterate: {
					type = tmp->stack->active->scope_level;
					break;
				}
				case bsl_statement_type_return: {
					type = tmp->stack->active->scope_level;
					break;
				}
				case bsl_statement_type_func: {
					type = BSLScope_func;
					break;
				}
				default: {
					break;
				}
			}
			
			bsl_stack_item_advance(&(tmp->stack->active), type, depth);
			
			if (bsl_context_check_error(*context) != bsl_error_none) {
				break;
			}
			
		}
		else {
			index++;
		}
	}
}

bsl_variable * bsl_symbol_render_logic(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) {
	bsl_variable *var = bsl_variable_create_type(bsl_variable_type_from_func_rtype(rtype));
	
	debug_printf("%s"," calling interpreted\n");
	
	bsl_context *tmp = (*context);
	
	bsl_function_interpreted interp = symbol->u.func.u.interp;
	
	bsl_stack_item_advance(&(tmp->stack->active), tmp->stack->active->scope_level, tmp->stack->active->scope_depth);
	
	bsl_execute_interpreted_code(interp.code, context);
	
	return var;
}

bsl_variable * bsl_symbol_make_call(bsl_context **context, bsl_symbol *symbol) {
	return bsl_symbol_parse_call_symbol(context, symbol, symbol->u.func.rtype, symbol->u.func.args, symbol->u.func.arg_count);
}

bsl_variable * bsl_symbol_parse_call_symbol(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) {
	bsl_variable *result = NULL;
	
	int mismatch_arg = bsl_symbol_parse_evaluate_symbol(context, symbol, rtype, args, arg_count);
	
	FunctionPointer call = NULL;
	
	bsl_function function = symbol->u.func;
	
	if (function.type == bsl_func_type_comp) {
		call = function.u.comp.call;
	}
	else {
		call = bsl_symbol_render_logic;
	}
	
	if (call != NULL && mismatch_arg == 0) {
		debug_printf("%s"," -> ");
		result = call(context, symbol, rtype, args, arg_count);
	}
	else {
		debug_printf("%s"," -> error in symbol parse\n");
	}
	
	if ((*context)->error != bsl_error_none) {
		bsl_context_check_error(*context);
	}
	
	return result;
}

bsl_variable * bsl_symbol_parse_call(bsl_context **context, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) {
	return bsl_symbol_parse_call_symbol(context, (*context)->stack->active->symbol, rtype, args, arg_count);
}