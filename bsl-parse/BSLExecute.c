//
//  BSLExecute.c
//  bsl-parse
//
//  Created by Samantha Marshall on 12/28/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#include "BSLExecute.h"
#include "BSLContext.h"
#include "BSLEvaluate.h"
#include "BSLVariable.h"
#include "BSLStatement.h"
#include "BSLSymbol.h"
#include "BSLStack.h"

#include "BSLStatement_Conditional.h"
#include "BSLStatement_Func.h"
#include "BSLStatement_Schedule.h"
#include "BSLStatement_Fork.h"
#include "BSLStatement_Sleep.h"
#include "BSLStatement_Iterate.h"

int bsl_symbol_execute(char *name, bsl_context *context)
{
	int result = 0;

	bsl_symbol *symbol = bsl_db_get_global(name, context);

	if (symbol != NULL) {

		if (symbol->type == bsl_symbol_type_function) {
			debug_printf("calling into [%s]\n", name);
			// setup state

			bsl_symbol_make_call(&context, symbol);
		}
		else {
			// "main" has to be a function
			context->error = bsl_error_missing_initializer;

			result = -1;
		}
	}
	else {
		// could not locate symbol
		context->error = bsl_error_missing_initializer;

		result = -1;
	}

	return result;
}

int bsl_symbol_parse_evaluate_symbol(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count)
{
	debug_printf("%s %s(", bsl_variable_get_type_name(bsl_variable_type_from_func_rtype(rtype)), symbol->u.func.name);

	int mismatch_arg = 0;

	for (uint32_t param_index = 0; param_index < symbol->u.func.arg_count; param_index++) {
		int8_t matched_type = 0;

		debug_printf("%s", "[");

		for (uint32_t type_index = 0; type_index < symbol->u.func.args[param_index].arg_type_count; type_index++) {

			bsl_variable var = symbol->u.func.args[param_index].args[type_index];
			bsl_variable_type var_type = var.type;
			char *var_name = var.name;

			debug_printf("%s:%s", var_name, bsl_variable_get_type_name(var_type));

			if (type_index + 1 < symbol->u.func.args[param_index].arg_type_count) {
				debug_printf("%s", " | ");
			}

			if (matched_type == 0) {
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
		}

		debug_printf("%s", "] = ");

		// this is error checking for passed arguments
		switch (matched_type) {
			case 0: {
				// not matched!
				bsl_context_assign_error((*context), bsl_error_invalid_parameter_type); // ERROR ASSIGNMENT
				mismatch_arg++;
				break;
			}
			case 1: {
				// add checks for compatible types and convert them before evaluating

				// matched!
				if (param_index < arg_count) {
					switch (args[param_index].args[0].type) {
						case bsl_variable_int: {
							debug_printf("%i", args[param_index].args[0].u.i);
							break;
						}
						case bsl_variable_bool: {
							debug_printf("%i", args[param_index].args[0].u.b);
							break;
						}
						case bsl_variable_float: {
							debug_printf("%f", args[param_index].args[0].u.f);
							break;
						}
						case bsl_variable_string: {
							debug_printf("%s", args[param_index].args[0].u.s);
							break;
						}
						case bsl_variable_None: {
							debug_printf("%s", "void");
							break;
						}
						default: {
							// error
							bsl_context_assign_error(*context, bsl_error_invalid_parameter_type);
							break;
						}
					}
				}
				break;
			}
			case 2: {
				// null passed
				debug_printf("%s", "NULL");
				break;
			}
			default: {
				break;
			}
		}

		if (param_index + 1 < symbol->u.func.arg_count) {
			debug_printf("%s", ", ");
		}
	}

	debug_printf("%s", ")");

	return mismatch_arg;
}

int bsl_symbol_parse_evaluate(bsl_context **context, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count)
{
	return bsl_symbol_parse_evaluate_symbol(context, (*context)->stack[(*context)->stack_pos].symbol, rtype, args, arg_count);
}

bsl_task * bsl_generate_statements_from_interpreted_code(bsl_interpreted_code code, bsl_context **context)
{
	bsl_task *task = calloc(1, sizeof(bsl_task));
	task->statements = calloc(1, sizeof(bsl_symbol));
	
	bsl_context *tmp = (*context);
	
	uint32_t index = 0;
	
	while (index < code.expression_count) {
		bsl_expression expr = code.expression[index];
		
		bsl_tkn_ir *curr = expr.tokens;
		
		if (curr != NULL && curr->token != NULL) {
			
			bsl_statement statement = bsl_statement_parse(&curr, tmp, code, &index);
			
			bsl_symbol *expr_statement = bsl_symbol_create(bsl_symbol_type_statement);
			expr_statement->u.expr = statement;
			bsl_symbol_update_info(expr_statement, expr.tokens->token->offset);
			
			
			task->statements = realloc(task->statements, sizeof(bsl_symbol) * (task->statement_count + 1));
			memcpy(&(task->statements[task->statement_count]), expr_statement, sizeof(bsl_symbol));
			task->statement_count += 1;
			
			if (bsl_context_check_error(*context) != bsl_error_none) {
				break;
			}
			
		}
		else {
			index++;
		}
		
	}
	
	return task;
}


void bsl_execute_interpreted_code(bsl_interpreted_code code, bsl_context **context)
{

	bsl_context *tmp = (*context);

	uint32_t index = 0;

	while (index < code.expression_count) {
		bsl_expression expr = code.expression[index];

		bsl_tkn_ir *curr = expr.tokens;

		if (curr != NULL && curr->token != NULL) {

			bsl_statement statement = bsl_statement_parse(&curr, tmp, code, &index);

			bsl_symbol *expr_statement = bsl_symbol_create(bsl_symbol_type_statement);
			expr_statement->u.expr = statement;
			bsl_symbol_update_info(expr_statement, expr.tokens->token->offset);
			
			bsl_task *current = &(tmp->tasks[tmp->task_pos]);

			current->statements = realloc(current->statements, sizeof(bsl_symbol) * (current->statement_count + 1));
			memcpy(&(current->statements[current->statement_count]), expr_statement, sizeof(bsl_symbol));
			current->statement_count += 1;

			if (bsl_context_check_error(*context) != bsl_error_none) {
				break;
			}

//			bsl_statement *current_statement = &(current->statements[current->statement_count - 1].u.expr);
//
//			if (current_statement->type == bsl_statement_type_return) {
//				break;
//			}
//
//			bsl_script_offset offset = bsl_script_offset_from_symbol(expr_statement);
//
//			switch (current_statement->type) {
//				case bsl_statement_type_conditional: {
//					bsl_statement_conditional_action(context, current_statement, offset);
//					break;
//				}
//				case bsl_statement_type_func: {
//					bsl_statement_func_action(context, current_statement, offset);
//					break;
//				}
//				case bsl_statement_type_schedule: {
//					bsl_statement_schedule_action(context, current_statement, offset);
//					break;
//				}
//				case bsl_statement_type_fork: {
//					bsl_statement_fork_action(context, current_statement, offset);
//					break;
//				}
//				case bsl_statement_type_sleep: {
//					bsl_statement_sleep_action(context, current_statement, offset);
//					break;
//				}
//				case bsl_statement_type_iterate: {
//					bsl_statement_iterate_action(context, current_statement, offset);
//					break;
//				}
//				default: {
//					break;
//				}
//			}
		}
		else {
			index++;
		}
		
		bsl_context_update_tasks(context);
	}
}

bsl_variable *bsl_symbol_render_logic(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count)
{
	bsl_variable *var = bsl_variable_create_type(bsl_variable_type_from_func_rtype(rtype));

	debug_printf("%s", "\n\t\tcalling interpreted -> ");

	int mismatch_arg = bsl_symbol_parse_evaluate_symbol(context, symbol, rtype, args, arg_count);

	if (mismatch_arg != 0) {
		debug_printf(" -> error in %i total args!", mismatch_arg);
	}

	debug_printf("%s", "\n\n");

	bsl_function_interpreted interp = symbol->u.func.u.interp;

	bsl_execute_interpreted_code(interp.code, context);

	return var;
}

bsl_variable *bsl_symbol_make_call(bsl_context **context, bsl_symbol *symbol)
{
	return bsl_symbol_parse_call_symbol(context, symbol, symbol->u.func.rtype, symbol->u.func.args, symbol->u.func.arg_count);
}

bsl_variable *bsl_symbol_parse_call_symbol(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count)
{
	bsl_variable *result = NULL;

	bsl_func_arg_update(args, arg_count, context);

	bsl_frame_increment(*context, symbol);

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
		debug_printf("%s", " -> ");
		result = call(context, symbol, rtype, args, arg_count);
	}
	else {
		debug_printf("%s", " -> error in symbol parse\n");
	}

	if ((*context)->error != bsl_error_none) {
		bsl_context_check_error(*context);
	}

	bsl_frame_decrement(*context);

	return result;
}
