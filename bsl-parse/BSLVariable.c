//
//  BSLVariable.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLVariable.h"

bsl_variable_type bsl_variable_get_type(bsl_token_code code) {
	switch (code) {
		case BSLTokenCode_id_int:
		case BSLTokenCode_type_int: {
			return bsl_variable_int;
		}
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

char * bsl_variable_get_type_name(bsl_variable_type type) {
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
		case bsl_variable_None: {
			return "void";
		}
		default: {
			// error
			return "invalid";
		}
	}
}

bsl_variable * bsl_variable_create_from_token(bsl_token *token, bsl_context *context) {
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

uint32_t bsl_func_arg_parse_str(char **str, bsl_func_arg **f_args) {
	bsl_variable var = {0};
	uint32_t count = 0;
	
	bsl_func_arg *args = (*f_args);
	
	if (args == NULL) {
		args = calloc(1, sizeof(bsl_func_arg));
	}
	
	bsl_func_arg *tmp_arg = NULL;
	
start:
	{
		args = realloc(args, sizeof(bsl_func_arg) * (count + 1));
		
		if (tmp_arg == NULL) {
			tmp_arg = calloc(1, sizeof(bsl_func_arg));
		}
		
		memset(&var, 0, sizeof(bsl_variable));
		
		// do something about this
		
	}
	
	*f_args = args;
	
	return count;
}

uint32_t bsl_func_arg_parse(bsl_tkn_ir **item, bsl_context *context, bsl_func_arg **f_args) {
	bsl_variable var = {0};
	uint32_t count = 0;
	
	bsl_func_arg *args = (*f_args);
	
	if (args == NULL) {
		args = calloc(1, sizeof(bsl_func_arg));
	}
	
	bsl_func_arg *tmp_arg = NULL;
	
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
				
				// advance to var type
				curr = curr->next;

				// getting variable type
				tmp_arg->args[tmp_arg->arg_type_count].type = bsl_variable_get_type(curr->token->code);
				
				tmp_arg->arg_type_count++;
				
				curr = curr->next;
			}
			
			curr = curr->next;
		}
		else {
			
			// getting variable type
			var.type = bsl_variable_get_type(curr->token->code);
			
			curr = curr->next;
			
			var.name = calloc(curr->token->offset.length + 1, sizeof(char));
			strncpy(var.name, curr->token->contents, curr->token->offset.length);
			
			tmp_arg->args = calloc(1, sizeof(bsl_variable));
			memcpy(tmp_arg->args, &var, sizeof(bsl_variable));
			tmp_arg->arg_type_count = 1;
			
			curr = curr->next;
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
		
		if (curr->token->code == BSLTokenCode_ctl_comma) {
			goto start;
		}
		
	}
	
	*f_args = args;
	
	return count;
}

bsl_variable bsl_variable_parse(bsl_tkn_ir **item, bsl_context *context) {
	bsl_variable var = {0};
	int tmp_int = 0;
	float tmp_float = 0.f;
	int8_t tmp_bool = 0;
	char *tmp_str = NULL;
	
	// moving to the type identifier
	bsl_tkn_ir *curr = (*item)->next;
	
	if (curr == NULL || curr->token == NULL) {
		context->error = bsl_error_token_invalid_syntax;
		return var;
	}
	
	// getting variable type
	var.type = bsl_variable_get_type(curr->token->code);
	
	// moving to the name identifier
	curr = curr->next;
	
	if (curr == NULL || curr->token == NULL) {
		context->error = bsl_error_token_invalid_syntax;
		return var;
	}
	
	// copying the name;
	var.name = calloc(curr->token->offset.length + 1, sizeof(char));
	strncpy(var.name, curr->token->contents, curr->token->offset.length);
	
	// next identifier
	curr = curr->next;
	
	if (curr == NULL || curr->token == NULL) {
		context->error = bsl_error_token_invalid_syntax;
		return var;
	}
	
	if (curr->token->code == BSLTokenCode_op_assign) {
		// the identifier is an assignment, value should be stored.
		
		// going to value identifier
		curr = curr->next;
		
		if (curr == NULL || curr->token == NULL) {
			context->error = bsl_error_token_invalid_syntax;
			return var;
		}
		
		switch (var.type) {
			case bsl_variable_int: {
				if (curr->token->code == BSLTokenCode_id_int || curr->token->code == BSLTokenCode_id_false || curr->token->code == BSLTokenCode_id_true) {
					tmp_int = atoi(curr->token->contents);
				}
				else {
					// error
					context->error = bsl_error_var_invalid_type_assignment;
				}
				break;
			}
			case bsl_variable_bool: {
				if (curr->token->code == BSLTokenCode_id_false || curr->token->code == BSLTokenCode_id_true) {
					tmp_bool = (curr->token->code == BSLTokenCode_id_true ? 1 : 0);
				}
				else {
					// error
					context->error = bsl_error_var_invalid_type_assignment;
				}
				break;
			}
			case bsl_variable_float: {
				if (curr->token->code == BSLTokenCode_id_float) {
					// what about if it starts with an 'f'
					tmp_float = strtof(curr->token->contents, NULL);
				}
				else {
					// error
					context->error = bsl_error_var_invalid_type_assignment;
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
					context->error = bsl_error_var_invalid_type_assignment;
				}
				break;
			}
			default: {
				// error
				//context->error = bsl_error_var_invalid_type_assignment;
				break;
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
			context->error = bsl_error_var_invalid_type_id;
			break;
		}
	}
	
	// end of evaluation line
	*item = curr;
	
	return var;
}

void bsl_variable_set(bsl_variable *variable, bsl_variable *value) {
	if (variable->type == value->type) {
		debug_printf("assigning var [%s:",variable->name);
		switch (variable->type) {
			case bsl_variable_int: {
				debug_printf("int] [%i -> ",variable->u.i);
				variable->u.i = value->u.i;
				debug_printf("%i]\n",variable->u.i);
				break;
			}
			case bsl_variable_bool: {
				debug_printf("bool] [%i -> ",variable->u.b);
				variable->u.b = value->u.b;
				debug_printf("%i]\n",variable->u.i);
				break;
			}
			case bsl_variable_float: {
				debug_printf("float] [%f -> ",variable->u.f);
				variable->u.f = value->u.f;
				debug_printf("%f]\n",variable->u.f);
				break;
			}
			case bsl_variable_string: {
				debug_printf("string] [%s -> ",variable->u.s);
				if (variable->u.s != NULL) {
					free(variable->u.s);
				}
				variable->u.s = value->u.s;
				debug_printf("%s]\n",variable->u.s);
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

void bsl_variable_release(bsl_variable variable) {
	if (variable.name) {
		free(variable.name);
	}
	
	if (variable.type == bsl_variable_string) {
		if (variable.u.s != NULL) {
			free(variable.u.s);
		}
	}
}