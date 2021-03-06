//
//  BSLVariable.c
//  bsl-parse
//
//  Created by Samantha Marshall on 12/28/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#include "BSLVariable.h"
#include "BSLExecute.h"
#include "BSLSymbol.h"

#include "BSLStatement_Func.h"

int8_t bsl_variable_is_type_compatible(bsl_variable_type def, bsl_variable_type arg_type)
{
	int8_t result = -1;

	switch (def) {
		case bsl_variable_int: {
			switch (arg_type) {
				case bsl_variable_int:
				case bsl_variable_bool: {
					result = 1;
					break;
				}
				case bsl_variable_string:
				case bsl_variable_float:
				case bsl_variable_void: {
					result = 0;
					break;
				}
				default: {
					break;
				}
			}
			break;
		}
		case bsl_variable_bool: {
			switch (arg_type) {
				case bsl_variable_int:
				case bsl_variable_bool: {
					result = 1;
					break;
				}
				case bsl_variable_string:
				case bsl_variable_float:
				case bsl_variable_void: {
					result = 0;
					break;
				}
				default: {
					break;
				}
			}
			break;
		}
		case bsl_variable_string: {
			switch (arg_type) {
				case bsl_variable_int:
				case bsl_variable_bool:
				case bsl_variable_float:
				case bsl_variable_void: {
					result = 0;
					break;
				}
				case bsl_variable_string: {
					result = 1;
					break;
				}
				default: {
					break;
				}
			}
			break;
		}
		case bsl_variable_float: {
			switch (arg_type) {
				case bsl_variable_int:
				case bsl_variable_bool:
				case bsl_variable_float: {
					result = 1;
					break;
				}
				case bsl_variable_string:
				case bsl_variable_void: {
					result = 0;
					break;
				}
				default: {
					break;
				}
			}
			break;
		}
		case bsl_variable_void: {
			switch (arg_type) {
				case bsl_variable_int:
				case bsl_variable_bool:
				case bsl_variable_string:
				case bsl_variable_float: {
					result = 0;
					break;
				}
				case bsl_variable_void: {
					result = 1;
					break;
				}
				default: {
					break;
				}
			}
			break;
		}
		default: {
			break;
		}
	}

	return result;
}

char *bsl_variable_print(bsl_variable variable)
{
	char *text = calloc(1024, sizeof(char));
	uint32_t counter = 0;

	text[counter] = '[';
	counter++;

	char *type = bsl_variable_get_type_name(variable.type);

	strncpy(&(text[counter]), type, strlen(type));
	counter += strlen(type);

	text[counter] = ':';
	counter++;

	switch (variable.type) {
		case bsl_variable_int: {
			snprintf(&(text[counter]), 1024 - counter, "%i]", variable.u.i);
			break;
		}
		case bsl_variable_bool: {
			snprintf(&(text[counter]), 1024 - counter, "%s]", (variable.u.b ? "true" : "false"));
			break;
		}
		case bsl_variable_float: {
			snprintf(&(text[counter]), 1024 - counter, "%f]", variable.u.f);
			break;
		}
		case bsl_variable_string: {
			snprintf(&(text[counter]), 1024 - counter, "%s]", variable.u.s);
			break;
		}
		case bsl_variable_void: {
			snprintf(&(text[counter]), 1024 - counter, "%s]", "NULL");
			break;
		}
		default: {
			// error
			break;
		}
	}

	return text;
}

bsl_variable *bsl_variable_create_type(bsl_variable_type type)
{
	bsl_variable *var = calloc(1, sizeof(bsl_variable));

	if (var != NULL) {
		var->type = type;
	}

	return var;
}

bsl_variable_type bsl_variable_type_from_func_rtype(bsl_func_rtype type)
{
	switch (type) {
		case bsl_func_rtype_bool: {
			return bsl_variable_bool;
		}
		case bsl_func_rtype_int: {
			return bsl_variable_int;
		}
		case bsl_func_rtype_void: {
			return bsl_variable_void;
		}
		case bsl_func_rtype_float: {
			return bsl_variable_float;
		}
		case bsl_func_rtype_string: {
			return bsl_variable_string;
		}
		default: {
			return bsl_variable_None;
		}
	}
}

bsl_variable_type bsl_variable_get_type(bsl_token_code code)
{
	switch (code) {
		case BSLTokenCode_id_int:
		case BSLTokenCode_type_int: {
			return bsl_variable_int;
		}
		case BSLTokenCode_id_true:
		case BSLTokenCode_id_false:
		case BSLTokenCode_id_bool:
		case BSLTokenCode_type_bool: {
			return bsl_variable_bool;
		}
		case BSLTokenCode_id_float:
		case BSLTokenCode_type_float: {
			return bsl_variable_float;
		}
		case BSLTokenCode_id_generic: {
			// there needs to be a way to identify variables by identifier
		}
		case BSLTokenCode_id_string:
		case BSLTokenCode_type_string: {
			return bsl_variable_string;
		}
		default: {
			// error
			return bsl_variable_None;
		}
	}
}

char *bsl_variable_get_type_name(bsl_variable_type type)
{
	switch (type) {
		case bsl_variable_int: {
			return "int";
		}
		case bsl_variable_bool: {
			return "bool";
		}
		case bsl_variable_float: {
			return "float";
		}
		case bsl_variable_string: {
			return "string";
		}
		case bsl_variable_void: {
			return "void";
		}
		default: {
			// error
			return "invalid";
		}
	}
}

bsl_variable *bsl_variable_create_from_token(bsl_token *token, bsl_context *context)
{
	bsl_variable *var = calloc(1, sizeof(bsl_variable));

	if (var != NULL) {

		int tmp_int = 0;
		float tmp_float = 0.f;
		int8_t tmp_bool = 0;
		char *tmp_str = calloc(token->offset.length + 1, sizeof(char));
		strncpy(tmp_str, token->contents, token->offset.length);

		bsl_symbol *test_symbol = bsl_db_get_global(tmp_str, context);
		if (test_symbol != NULL) {
			// this is a symbol
			if (test_symbol->type == bsl_symbol_type_variable) {
				// this is a variable
				memcpy(var, &(test_symbol->u.value), sizeof(bsl_variable));
			}
		}
		else {
			var->type = bsl_variable_get_type(token->code);

			switch (var->type) {
				case bsl_variable_int: {
					char *f = strnstr(token->contents, "f", sizeof(char[token->offset.length]));
					if (f != NULL) {
						f++;
						if (((uintptr_t)f - (uintptr_t)token->contents) != 1) {
							f = token->contents;
						}
					}
					else {
						f = token->contents;
					}
					tmp_int = atoi(f);
					break;
				}
				case bsl_variable_bool: {
					tmp_bool = (token->code == BSLTokenCode_id_true ? 1 : 0);
					break;
				}
				case bsl_variable_float: {
					tmp_float = strtof(token->contents, NULL);
					break;
				}
				case bsl_variable_string: {
					tmp_str = tmp_str;
					break;
				}
				default: {
					// error
					break;
				}
			}

			switch (var->type) {
				case bsl_variable_int: {
					var->u.i = tmp_int;
					break;
				}
				case bsl_variable_bool: {
					var->u.b = tmp_bool;
					break;
				}
				case bsl_variable_float: {
					var->u.f = tmp_float;
					break;
				}
				case bsl_variable_string: {
					var->u.s = tmp_str;
					break;
				}
				default: {
					// error
					break;
				}
			}
		}
	}

	return var;
}

bsl_variable *bsl_variable_parse_token(bsl_tkn_ir **item, bsl_context *context)
{
	bsl_variable *var = calloc(1, sizeof(bsl_variable));

	bsl_tkn_ir *curr = *item;

	if (var != NULL) {

		var->type = bsl_variable_get_type(curr->token->code);

		switch (var->type) {
			case bsl_variable_int: {
				if (curr->token->code == BSLTokenCode_id_int || curr->token->code == BSLTokenCode_id_false || curr->token->code == BSLTokenCode_id_true) {
					var->u.i = atoi(curr->token->contents);
				}
				else {
					// error
					bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
				}
				break;
			}
			case bsl_variable_bool: {
				if (curr->token->code == BSLTokenCode_id_false || curr->token->code == BSLTokenCode_id_true) {
					var->u.b = (curr->token->code == BSLTokenCode_id_true ? 1 : 0);
				}
				else if (curr->token->code == BSLTokenCode_id_int) {
					int value = atoi(curr->token->contents);

					switch (value) {
						case 0: {
							var->u.b = 0;
							break;
						}
						case 1: {
							var->u.b = 1;
							break;
						}
						default: {
							bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
							break;
						}
					}
				}
				else {
					// error
					bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
				}
				break;
			}
			case bsl_variable_float: {
				if (curr->token->code == BSLTokenCode_id_float || curr->token->code == BSLTokenCode_id_int) {
					// what about if it starts with an 'f'
					var->u.f = strtof(curr->token->contents, NULL);
				}
				else {
					// error
					bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
				}
				break;
			}
			case bsl_variable_string: {

				if (curr->token->code == BSLTokenCode_id_string || curr->token->code == BSLTokenCode_id_generic) {
					var->u.s = calloc(curr->token->offset.length + 1, sizeof(char));
					strncpy(var->u.s, curr->token->contents, curr->token->offset.length);
				}
				else {
					// error
					bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
				}
				break;
			}
			default: {
				// error
				bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
				break;
			}
		}
	}

	*item = curr;

	return var;
}

bsl_variable *bsl_variable_func_arg_parse(bsl_tkn_ir **item, bsl_context *context)
{
	bsl_tkn_ir *curr = *item;

	// advance an item
	curr = curr->next;

	bsl_variable *variable = bsl_variable_parse_token(&curr, context);

	*item = curr;

	return variable;
}

uint32_t bsl_func_arg_parse(bsl_tkn_ir **item, bsl_context *context, bsl_func_arg **f_args)
{
	bsl_variable var = {0};
	uint32_t count = 0;

	bsl_func_arg *args = (*f_args);

	if (args == NULL) {
		args = calloc(1, sizeof(bsl_func_arg));
	}

	bsl_func_arg *tmp_arg = NULL;

	// clang-format off
start:
	{
		args = realloc(args, sizeof(bsl_func_arg) * (count + 1));
		
		if (tmp_arg == NULL) {
			tmp_arg = calloc(1, sizeof(bsl_func_arg));
		}
		
		memset(&var, 0, sizeof(bsl_variable));
		
		// moving to the type identifier
		bsl_tkn_ir *curr = (*item)->next;
		
		if (curr->token->code == BSLTokenCode_ctl_lbracket) {
			// advancing to next token
			curr = curr->next;
			
			while (curr->token->code == BSLTokenCode_id_newline) {
				curr = curr->next;
			}
			
			while (curr->token->code != BSLTokenCode_ctl_rbracket) {
				
				while (curr->token->code == BSLTokenCode_bar) {
					curr = curr->next;
				}
				
				// this is for function parameter variables
				if (tmp_arg->args == NULL) {
					tmp_arg->args = calloc(1, sizeof(bsl_variable));
				}
				tmp_arg->args = realloc(tmp_arg->args, sizeof(bsl_variable) * (tmp_arg->arg_type_count + 1));
				
				tmp_arg->args[tmp_arg->arg_type_count].name = calloc(curr->token->offset.length + 1, sizeof(char));
				strncpy(tmp_arg->args[tmp_arg->arg_type_count].name, curr->token->contents, curr->token->offset.length);
				
				// colon
				curr = curr->next;
				while (curr->token->code == BSLTokenCode_id_newline) {
					curr = curr->next;
				}
				
				// advance to var type
				curr = curr->next;
				while (curr->token->code == BSLTokenCode_id_newline) {
					curr = curr->next;
				}

				// getting variable type
				tmp_arg->args[tmp_arg->arg_type_count].type = bsl_variable_get_type(curr->token->code);
				
				tmp_arg->arg_type_count++;
				
				curr = curr->next;
				while (curr->token->code == BSLTokenCode_id_newline) {
					curr = curr->next;
				}

			}
			
			curr = curr->next;
			while (curr->token->code == BSLTokenCode_id_newline) {
				curr = curr->next;
			}

		}
		else {
			
			// getting variable type
			var.type = bsl_variable_get_type(curr->token->code);
			
			curr = curr->next;
			
			while (curr->token->code == BSLTokenCode_id_newline) {
				curr = curr->next;
			}
			
			var.name = calloc(curr->token->offset.length + 1, sizeof(char));
			strncpy(var.name, curr->token->contents, curr->token->offset.length);
			
			tmp_arg->args = calloc(1, sizeof(bsl_variable));
			memcpy(tmp_arg->args, &var, sizeof(bsl_variable));
			tmp_arg->arg_type_count = 1;
			
			curr = curr->next;
			while (curr->token->code == BSLTokenCode_id_newline) {
				curr = curr->next;
			}

		}

		if (tmp_arg->arg_type_count > 0) {
			args[count].args = calloc(tmp_arg->arg_type_count, sizeof(bsl_variable));
			args[count].arg_type_count = tmp_arg->arg_type_count;
		
			for (uint32_t index = 0; index < tmp_arg->arg_type_count; index++) {
				memcpy(&(args[count].args[index]), &(tmp_arg->args[index]), sizeof(bsl_variable));
			}
		}
		
		free(tmp_arg);
		tmp_arg = NULL;
		
		count++;
		
		// end of evaluation line
		*item = curr;
		
		// max count of 8 arguments
		if (count > 8) {
			// error
			goto error_check;
		}
		
		if (curr->token->code == BSLTokenCode_ctl_comma) {
			goto start;
		}
		
	}
	// clang-format on

	// clang-format off
error_check:
	{
		if (count > 8) {
			// throw error
			bsl_context_assign_error(context, bsl_error_func_param_count_max); // ERROR ASSIGNMENT
		}
	}
	// clang-format on

	*f_args = args;

	return count;
}

void bsl_func_arg_update(bsl_func_arg *args, uint32_t arg_count, bsl_context **context)
{
	for (uint32_t arg_index = 0; arg_index < arg_count; arg_index++) {
		bsl_variable *log_variable = args[arg_index].args;

		if (log_variable->type == bsl_variable_string && log_variable->u.s != NULL) {
			bsl_symbol *lookup_symbol = bsl_db_get_state(log_variable->u.s, (*context));
			;

			if (lookup_symbol != NULL) {
				if (lookup_symbol->type == bsl_symbol_type_variable) {
					log_variable = &(lookup_symbol->u.value);

					args[arg_index].args->type = log_variable->type;

					switch (args[arg_index].args->type) {
						case bsl_variable_int: {
							args[arg_index].args->u.i = log_variable->u.i;
							break;
						}
						case bsl_variable_bool: {
							args[arg_index].args->u.b = log_variable->u.b;
							break;
						}
						case bsl_variable_string: {
							args[arg_index].args->u.s = log_variable->u.s;
							break;
						}
						case bsl_variable_float: {
							args[arg_index].args->u.f = log_variable->u.f;
							break;
						}
						default: {
							break;
						}
					}
				}
			}
		}
	}
}

void bsl_variable_parse_assign(bsl_tkn_ir **item, bsl_context *context, bsl_variable *variable)
{
	bsl_variable var = *variable;
	int tmp_int = 0;
	float tmp_float = 0.f;
	int8_t tmp_bool = 0;
	char *tmp_str = NULL;

	// moving to the type identifier
	bsl_tkn_ir *curr = (*item)->next;

	if (curr == NULL || curr->token == NULL) {
		bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
		return;
	}

	if (curr->token->code == BSLTokenCode_op_assign) {
		// the identifier is an assignment, value should be stored.

		// going to value identifier
		curr = curr->next;

		if (curr == NULL || curr->token == NULL) {
			bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
			return;
		}

		int8_t is_symbol = 0;
		bsl_symbol *resolve_symbol = NULL;

		if (curr->token->code == BSLTokenCode_id_generic) {
			char *name = calloc(curr->token->offset.length + 1, sizeof(char));
			strncpy(name, curr->token->contents, curr->token->offset.length * sizeof(char));

			resolve_symbol = bsl_db_get_state(name, context);

			if (resolve_symbol != NULL) {
				is_symbol = 1;
			}

			if (context->stack[context->stack_pos].symbol == NULL) {
				context->stack[context->stack_pos].symbol = bsl_symbol_create(bsl_symbol_type_variable);
				context->stack[context->stack_pos].symbol->u.value = var;
				bsl_symbol_update_info(context->stack[context->stack_pos].symbol, (*item)->token->offset);
			}
		}

		if (is_symbol == 1) {

			switch (resolve_symbol->type) {
				case bsl_symbol_type_variable: {
					switch (var.type) {
						case bsl_variable_int: {
							tmp_int = resolve_symbol->u.value.u.i;
							break;
						}
						case bsl_variable_bool: {
							tmp_bool = resolve_symbol->u.value.u.b;
							break;
						}
						case bsl_variable_float: {
							tmp_float = resolve_symbol->u.value.u.f;
							break;
						}
						case bsl_variable_string: {
							tmp_str = resolve_symbol->u.value.u.s;
							break;
						}
						default: {
							// error
							bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
							break;
						}
					}
					break;
				}
				case bsl_symbol_type_function: {

					// parse and call function

					bsl_statement_func func = bsl_statement_func_create(&curr, context);

					bsl_symbol *tmp = bsl_symbol_create(bsl_symbol_type_function);
					tmp->u.func = func.function;
					tmp->script = resolve_symbol->script;
					tmp->line = resolve_symbol->line;
					tmp->index = resolve_symbol->index;
					resolve_symbol = tmp;

					switch (var.type) {
						case bsl_variable_int: {
							if (resolve_symbol->u.func.rtype == bsl_func_rtype_int || resolve_symbol->u.func.rtype == bsl_func_rtype_bool) {
								bsl_variable *value = bsl_symbol_make_call(&context, resolve_symbol);
								if (value != NULL) {
									tmp_int = value->u.i;
								}
								else {
									// error
								}
							}
							else {
								// error
								bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
							}
							break;
						}
						case bsl_variable_bool: {
							if (resolve_symbol->u.func.rtype == bsl_func_rtype_int || resolve_symbol->u.func.rtype == bsl_func_rtype_bool) {
								bsl_variable *value = bsl_symbol_make_call(&context, resolve_symbol);
								if (value != NULL) {
									tmp_bool = value->u.b;
								}
								else {
									// error
								}
							}
							else {
								// error
								bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
							}
							break;
						}
						case bsl_variable_float: {
							if (resolve_symbol->u.func.rtype == bsl_func_rtype_int || resolve_symbol->u.func.rtype == bsl_func_rtype_float) {
								// what about if it starts with an 'f'
								bsl_variable *value = bsl_symbol_make_call(&context, resolve_symbol);
								if (value != NULL) {
									tmp_float = value->u.f;
								}
								else {
									// error
								}
							}
							else {
								// error
								bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
							}
							break;
						}
						case bsl_variable_string: {
							if (resolve_symbol->u.func.rtype == bsl_func_rtype_string) {
								bsl_variable *value = bsl_symbol_make_call(&context, resolve_symbol);
								if (value != NULL) {
									tmp_str = value->u.s;
								}
								else {
									// error
								}
							}
							else {
								// error
								bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
							}
							break;
						}
						default: {
							// error
							bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
							break;
						}
					}

					break;
				}
				default: {
					break;
				}
			}
		}
		else {

			switch (var.type) {
				case bsl_variable_int: {
					if (curr->token->code == BSLTokenCode_id_int || curr->token->code == BSLTokenCode_id_false || curr->token->code == BSLTokenCode_id_true) {
						tmp_int = atoi(curr->token->contents);
					}
					else {
						// error
						bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
					}
					break;
				}
				case bsl_variable_bool: {
					if (curr->token->code == BSLTokenCode_id_false || curr->token->code == BSLTokenCode_id_true) {
						tmp_bool = (curr->token->code == BSLTokenCode_id_true ? 1 : 0);
					}
					else if (curr->token->code == BSLTokenCode_id_int) {
						int value = atoi(curr->token->contents);
						
						switch (value) {
							case 0: {
								tmp_bool = 0;
								break;
							}
							case 1: {
								tmp_bool = 1;
								break;
							}
							default: {
								bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
								break;
							}
						}
					}
					else {
						// error
						bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
					}
					break;
				}
				case bsl_variable_float: {
					if (curr->token->code == BSLTokenCode_id_float || curr->token->code == BSLTokenCode_id_int) {
						// what about if it starts with an 'f'
						tmp_float = strtof(curr->token->contents, NULL);
					}
					else {
						// error
						bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
					}
					break;
				}
				case bsl_variable_string: {
					if (curr->token->code == BSLTokenCode_id_string || curr->token->code == BSLTokenCode_id_generic) {
						tmp_str = calloc(curr->token->offset.length + 1, sizeof(char));
						strncpy(tmp_str, curr->token->contents, curr->token->offset.length);
					}
					else {
						// error
						bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
					}
					break;
				}
				default: {
					// error
					bsl_context_assign_error(context, bsl_error_var_invalid_type_assignment); // ERROR ASSIGNMENT
					break;
				}
			}
		}

		curr = curr->next;
	}

	switch (var.type) {
		case bsl_variable_int: {
			var.u.i = tmp_int;
			break;
		}
		case bsl_variable_bool: {
			var.u.b = tmp_bool;
			break;
		}
		case bsl_variable_float: {
			var.u.f = tmp_float;
			break;
		}
		case bsl_variable_string: {
			var.u.s = tmp_str;
			break;
		}
		default: {
			// error
			bsl_context_assign_error(context, bsl_error_var_invalid_type_id); // ERROR ASSIGNMENT
			break;
		}
	}

	// end of evaluation line
	*item = curr;

	*variable = var;
}

bsl_variable bsl_variable_parse(bsl_tkn_ir **item, bsl_context *context)
{
	bsl_variable var = {0};

	// moving to the type identifier
	bsl_tkn_ir *curr = (*item)->next;

	if (curr == NULL || curr->token == NULL) {
		bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
		return var;
	}

	// getting variable type
	var.type = bsl_variable_get_type(curr->token->code);

	// moving to the name identifier
	curr = curr->next;

	if (curr == NULL || curr->token == NULL) {
		bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
		return var;
	}

	// copying the name;
	var.name = calloc(curr->token->offset.length + 1, sizeof(char));
	strncpy(var.name, curr->token->contents, curr->token->offset.length);

	// next identifier
	bsl_variable_parse_assign(&curr, context, &var);

	// end of evaluation line
	*item = curr;

	return var;
}

void bsl_variable_set(bsl_variable *variable, bsl_variable *value)
{
	if (variable->type == value->type) {
		debug_printf("assigning var [%s:", variable->name);
		switch (variable->type) {
			case bsl_variable_int: {
				debug_printf("int] [%i -> ", variable->u.i);
				variable->u.i = value->u.i;
				debug_printf("%i]\n", variable->u.i);
				break;
			}
			case bsl_variable_bool: {
				debug_printf("bool] [%i -> ", variable->u.b);
				variable->u.b = value->u.b;
				debug_printf("%i]\n", variable->u.i);
				break;
			}
			case bsl_variable_float: {
				debug_printf("float] [%f -> ", variable->u.f);
				variable->u.f = value->u.f;
				debug_printf("%f]\n", variable->u.f);
				break;
			}
			case bsl_variable_string: {
				debug_printf("string] [%s -> ", variable->u.s);
				if (variable->u.s != NULL) {
					free(variable->u.s);
				}
				variable->u.s = value->u.s;
				debug_printf("%s]\n", variable->u.s);
				break;
			}
			default: {
				// error
				break;
			}
		}
	}
	else {
		// error type mis-match
	}
}

void bsl_variable_release(bsl_variable variable)
{
	if (variable.name) {
		free(variable.name);
	}

	if (variable.type == bsl_variable_string) {
		if (variable.u.s != NULL) {
			free(variable.u.s);
		}
	}
}