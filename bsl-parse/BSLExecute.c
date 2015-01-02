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

int bsl_symbol_execute(char *name, bsl_context *context) {
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

int bsl_symbol_parse_evaluate(bsl_context **context, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) {
	debug_printf("%s(",(*context)->stack->active->symbol->u.func.name);
	
	int mismatch_arg = 0;
	
	for (uint32_t param_index = 0; param_index < (*context)->stack->active->symbol->u.func.arg_count; param_index++) {
		int8_t matched_type = 0;
		
		debug_printf("%s","[");
		
		for (uint32_t type_index = 0; type_index < (*context)->stack->active->symbol->u.func.args[param_index].arg_type_count; type_index++) {
			
			bsl_variable var = (*context)->stack->active->symbol->u.func.args[param_index].args[type_index];
			bsl_variable_type var_type = var.type;
			char *var_name = var.name;
			
			debug_printf("%s:%s", var_name, bsl_variable_get_type_name(var_type));
			
			if (type_index + 1 < (*context)->stack->active->symbol->u.func.args[param_index].arg_type_count) {
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
		
		if (param_index + 1 < (*context)->stack->active->symbol->u.func.arg_count) {
			debug_printf("%s",", ");
		}
		
	}
	
	debug_printf("%s",")");
	
	return mismatch_arg;
}

uintptr_t* bsl_symbol_parse_call(bsl_context **context, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) {

	int mismatch_arg = bsl_symbol_parse_evaluate(context, rtype, args, arg_count);
	
	FunctionPointer call = (*context)->stack->active->symbol->u.func.u.comp.call;
	
	if (call != NULL && mismatch_arg == 0) {
		debug_printf("%s"," -> ");
		return call(context, rtype, args, arg_count);
	}
	else {
		debug_printf("%s","\n");
		return NULL;
	}
}