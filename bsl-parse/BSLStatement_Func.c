//
//  BSLStatement_Func.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Func.h"
#include "BSLExecute.h"
#include "BSLVariable.h"
#include "BSLExpression.h"

bsl_statement_func bsl_statement_func_create(bsl_tkn_ir **token, bsl_context *context)
{
	bsl_statement_func func = {0};

	bsl_symbol *symbol = NULL;

	bsl_symbol *call_symbol = NULL;

	bsl_tkn_ir *curr = *token;

	debug_printf("%s", "function call: ");

	bsl_func_arg *args = NULL;
	uint32_t arg_count = 0;

	char *name = NULL;

	if (name == NULL) {
		name = calloc(curr->token->offset.length + 1, sizeof(char));
		strncpy(name, curr->token->contents, sizeof(char) * curr->token->offset.length);
	}

	symbol = bsl_db_get_state(name, context);

	call_symbol = symbol;

	if (symbol->type == bsl_symbol_type_variable) {
		if (name == NULL) {
			name = calloc(curr->token->offset.length + 1, sizeof(char));
			strncpy(name, curr->token->contents, sizeof(char) * curr->token->offset.length);
		}

		symbol = bsl_db_get_state(name, context);

		curr = curr->next;
	}

	if (symbol->type == bsl_symbol_type_function) {
		args = calloc(symbol->u.func.arg_count, sizeof(bsl_func_arg));
		arg_count = symbol->u.func.arg_count;
	}

	if (name != NULL) {
		free(name);
	}

	uint32_t counter = 0;
	while (curr->token != NULL) {
		if (curr->next == NULL) {
			break;
		}

		// do not need to advance for open paren, handled by `bsl_variable_func_arg_parse`

		if (curr->next->token->code == BSLTokenCode_ctl_comma) {
			// check for commas
			curr = curr->next;
		}

		if (curr->next->token->code == BSLTokenCode_ctl_rparen) {
			curr = curr->next;
			break;
		}

		if (curr == NULL || counter == arg_count) {
			break;
		}

		if (args[counter].args != NULL) {
			bsl_variable_release(*(args[counter].args));
		}

		args[counter].arg_type_count = 1;
		args[counter].args = bsl_variable_func_arg_parse(&curr, context);

		// get arg name
		for (uint32_t type_index = 0; type_index < symbol->u.func.args[counter].arg_type_count; type_index++) {
			bsl_variable parameter_definition = symbol->u.func.args[counter].args[type_index];

			if (parameter_definition.type == args[counter].args->type) {
				args[counter].args->name = parameter_definition.name;
			}
		}

		if (args[counter].args->name == NULL) {
			// error in types
		}

		if (args[counter].args->type != bsl_variable_None) {
			counter++;
		}
	}

	for (uint32_t index = counter; index < arg_count; index++) {
		args[index].args = calloc(1, sizeof(bsl_variable));
		args[index].arg_type_count = 1;

		memcpy(args[index].args, symbol->u.func.args[index].args, sizeof(bsl_variable));
	}

	// check if there are extra arguments
	if (curr->next != NULL) {

		bsl_tkn_ir *tmp = curr->next;

		if (tmp->token != NULL) {

			bsl_token_code code = tmp->token->code;

			if (code != BSLTokenCode_ctl_rparen && bsl_expression_check_end(code) == 0) {

				context->error = bsl_error_func_param_count_overload; // ERROR ASSIGNMENT
			}
		}
	}

	if (symbol != NULL) {

		if (call_symbol->type == bsl_symbol_type_function) {
			bsl_variable *result = bsl_symbol_parse_call_symbol(&context, symbol, symbol->u.func.rtype, args, arg_count);

			// the resulting value here is either always `void` or isn't stored so we can ignore the return value
			if (result->type != bsl_variable_void) {
				char *text = bsl_variable_print(*result);
				debug_printf("\t\t\tfunction returned %s", text);
				debug_printf("%s", ", with no assignment\n");
				free(text);
			}

			bsl_variable_release(*result);
		}
	}

	// move current position
	*token = curr;

	func.function.args = args;
	func.function.arg_count = arg_count;
	func.function.rtype = symbol->u.func.rtype;
	func.function.type = symbol->u.func.type;
	if (func.function.type == bsl_func_type_comp) {
		func.function.u.comp = symbol->u.func.u.comp;
	}
	if (func.function.type == bsl_func_type_interp) {
		func.function.u.interp = symbol->u.func.u.interp;
	}
	func.function.name = symbol->u.func.name;

	return func;
}