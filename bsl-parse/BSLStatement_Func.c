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

bsl_statement_func bsl_statement_func_create(bsl_tkn_ir **token, bsl_context *context) {
	bsl_statement_func func = {};
	
	bsl_symbol *symbol = context->stack->active->symbol;
	
	bsl_symbol *call_symbol = NULL;
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","function call: ");
	
	bsl_func_arg *args = NULL;
	uint32_t arg_count = 0;
	
	char *name = NULL;
	
	if (symbol == NULL) {
		if (name == NULL) {
			name = calloc(curr->token->offset.length + 1, sizeof(char));
			strncpy(name, curr->token->contents, sizeof(char) * curr->token->offset.length);
		}
		
		symbol = bsl_db_get_state(name, context);
	}
	
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
	
	if (symbol != NULL) {
		
		context->stack->active->scope_level	= BSLScope_func;
		context->stack->active->scope_depth += 1;
		
		if (call_symbol->type == bsl_symbol_type_function) {
			bsl_symbol_parse_call_symbol(&context, symbol, symbol->u.func.rtype, args, arg_count);
		}
		
		
		context->stack->active->scope_depth -= 1;
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