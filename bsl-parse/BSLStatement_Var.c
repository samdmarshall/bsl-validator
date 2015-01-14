//
//  BSLStatement_Var.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Var.h"
#include "BSLVariable.h"
#include "BSLSymbol.h"
#include "BSLStack.h"

bsl_statement_var bsl_statement_var_create(bsl_tkn_ir **token, bsl_context *context) {
	bsl_statement_var var = {};
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","variable creation: ");
	
	bsl_symbol *var_symbol = bsl_symbol_create(bsl_symbol_type_variable);
	bsl_symbol_update_info(var_symbol, curr->token->offset);
	
	var.variable = bsl_variable_parse(&curr, context);
	
	var_symbol->u.value = var.variable;
	
	bsl_symbol *symbol_test = bsl_stack_search_scope(var_symbol->u.value.name, context);
	if (symbol_test == NULL) {
		bsl_db_register_state(var_symbol->u.value.name, var_symbol, context);
	}
	else {
		// error, already registered symbol
		context->error = bsl_error_registered_symbol;
	}
	
	// move current position
	*token = curr;
	
	return var;
}

bsl_statement_var bsl_statement_var_assign(bsl_tkn_ir **token, bsl_context *context) {
	bsl_statement_var var = {};
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","variable assignment: ");
	
	char *name = calloc(curr->token->offset.length + 1, sizeof(char));
	strncpy(name, curr->token->contents, sizeof(char) * curr->token->offset.length);
	
	bsl_symbol *var_symbol = bsl_stack_search_scope(name, context);
	
	if (var_symbol->type == bsl_symbol_type_variable) {
		var.variable.type = var_symbol->u.value.type;
		
		var.variable.name = name;
	}
	
	bsl_variable_parse_assign(&curr, context, &(var.variable));
	
	bsl_variable_set(&(var_symbol->u.value), &(var.variable));
	
	// move current position
	*token = curr;
	
	return var;
}