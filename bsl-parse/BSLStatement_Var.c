//
//  BSLStatement_Var.c
//  bsl-parse
//
//  Created by Samantha Marshall on 1/8/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#include "BSLStatement_Var.h"
#include "BSLVariable.h"
#include "BSLSymbol.h"
#include "BSLStack.h"

bsl_statement_var bsl_statement_const_create(bsl_tkn_ir **token, bsl_context *context)
{
	bsl_statement_var constant = {0};

	bsl_tkn_ir *curr = *token;

	debug_printf("%s", "constant creation: ");

	bsl_variable *variable = bsl_variable_parse_token(token, context);
	memcpy(&(constant.variable), variable, sizeof(bsl_variable));
	free(variable);

#if DEBUG
	char *var_text = bsl_variable_print(constant.variable);
	debug_printf("%s\n", var_text);
	free(var_text);
#endif

	*token = curr->next;

	return constant;
}

bsl_statement_var bsl_statement_var_create(bsl_tkn_ir **token, bsl_context *context)
{
	bsl_statement_var var = {0};

	bsl_tkn_ir *curr = *token;

	debug_printf("%s", "variable creation: ");

	bsl_symbol *var_symbol = bsl_symbol_create(bsl_symbol_type_variable);
	bsl_symbol_update_info(var_symbol, curr->token->offset);

	var.variable = bsl_variable_parse(&curr, context);

	debug_printf("%s %s = ", bsl_variable_get_type_name(var.variable.type), var.variable.name);

	var_symbol->u.value = var.variable;

	bsl_symbol *symbol_test = bsl_frame_search_scope(var_symbol->u.value.name, context);
	if (symbol_test == NULL) {
		bsl_db_register_state(var_symbol->u.value.name, var_symbol, context);
	}
	else {
		// error, already registered symbol
		bsl_context_assign_error(context, bsl_error_registered_symbol); // ERROR ASSIGNMENT
		bsl_symbol_duplicate_description(var_symbol, symbol_test);
		bsl_context_check_error(context);
	}

#if DEBUG
	char *var_text = bsl_variable_print(var.variable);
	debug_printf("%s\n", var_text);
	free(var_text);
#endif

	// move current position
	*token = curr;

	return var;
}

bsl_statement_var bsl_statement_var_assign(bsl_tkn_ir **token, bsl_context *context)
{
	bsl_statement_var var = {};

	bsl_tkn_ir *curr = *token;

	debug_printf("%s", "variable assignment: ");

	char *name = calloc(curr->token->offset.length + 1, sizeof(char));
	strncpy(name, curr->token->contents, sizeof(char) * curr->token->offset.length);

	bsl_symbol *var_symbol = bsl_frame_search_scope(name, context);

	if (var_symbol->type == bsl_symbol_type_variable) {

		memcpy(&(var.variable), &(var_symbol->u.value), sizeof(bsl_variable));
	}

#if DEBUG
	char *var1_text = bsl_variable_print(var_symbol->u.value);
	debug_printf("%s %s", var_symbol->u.value.name, var1_text);
	free(var1_text);
#endif

	if (curr->next != NULL) {
		debug_printf("%s", " -> ");
		bsl_variable_parse_assign(&curr, context, &(var.variable));

		bsl_variable *symbol_variable = &(var_symbol->u.value);
		bsl_variable_set(symbol_variable, &(var.variable));

		bsl_db_register_state(var.variable.name, var_symbol, context);
	}

	// move current position
	*token = curr;

	return var;
}