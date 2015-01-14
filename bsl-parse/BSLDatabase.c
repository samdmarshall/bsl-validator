//
//  BSLDatabase.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLDatabase.h"
#include "BSLGlobals.h"
#include "BSLSymbol.h"
#include "BSLVariable.h"
#include "BSLParse.h"
#include "BSLScript.h"

#include "BSL_stdlib.h"

void bsl_db_register(char *name, bsl_symbol *symbol, cmap_str symtab) {
	cmap_str_setObjectForKey(symtab, name, symbol);
}

void bsl_db_register_function(bsl_register_func_item function, bsl_database *db) {
	bsl_symbol *func_symbol = bsl_symbol_create(bsl_symbol_type_function);
	
	// func_symbol->u.func
	func_symbol->u.func.type = bsl_func_type_comp;
	
	switch (function.rtype) {
		case bsl_db_register_type_void: {
			func_symbol->u.func.rtype = bsl_func_rtype_void;
			break;
		}
		case bsl_db_register_type_int: {
			func_symbol->u.func.rtype = bsl_func_rtype_int;
			break;
		}
		case bsl_db_register_type_float: {
			func_symbol->u.func.rtype = bsl_func_rtype_float;
			break;
		}
		case bsl_db_register_type_bool: {
			func_symbol->u.func.rtype = bsl_func_rtype_bool;
			break;
		}
		case bsl_db_register_type_string: {
			func_symbol->u.func.rtype = bsl_func_rtype_string;
			break;
		}
		default: {
			break;
		}
	}
	
	// parse args
	func_symbol->u.func.args = calloc(1, sizeof(bsl_func_arg));
	func_symbol->u.func.arg_count = 0;
	
	func_symbol->u.func.name = calloc(strlen(function.name) + 1, sizeof(char));
	strncpy(func_symbol->u.func.name, function.name, strlen(function.name));
	
	func_symbol->script = bsl_script_create_with_string(function.args);
	
	bsl_tkn_ir *args = bsl_token_ir_generate_from_script(func_symbol->script);
	
	bsl_tkn_ir *curr = args->next;
	
	while (curr->token->code != BSLTokenCode_ctl_rparen) {
		if (curr == NULL || curr->token == NULL) {
			break;
		}
		
		if (curr->token->code == BSLTokenCode_id_void) {
			curr = curr->next;
		}
		else {
			func_symbol->u.func.args = realloc(func_symbol->u.func.args, sizeof(bsl_func_arg) * (func_symbol->u.func.arg_count + 1));
			bsl_tkn_ir *variable = curr->prev;
			func_symbol->u.func.arg_count = bsl_func_arg_parse(&variable, NULL, &(func_symbol->u.func.args));
			curr = variable;
		}
	}
	
	func_symbol->u.func.u.comp.parse = function.parse;
	func_symbol->u.func.u.comp.call = function.call;
	
	bsl_db_register(function.name, func_symbol, db->symtab);
}

void bsl_db_register_variable(bsl_register_var_item variable, bsl_database *db) {
	bsl_symbol *var_symbol = bsl_symbol_create(bsl_symbol_type_variable);
	
	
	var_symbol->u.value.name = calloc(strlen(variable.name) + 1, sizeof(char));
	strncpy(var_symbol->u.value.name, variable.name, strlen(variable.name));
	
	switch (variable.type) {
		case bsl_db_register_type_void: {
			break;
		}
		case bsl_db_register_type_int: {
			var_symbol->u.value.type = bsl_variable_int;
			break;
		}
		case bsl_db_register_type_float: {
			var_symbol->u.value.type = bsl_variable_float;
			break;
		}
		case bsl_db_register_type_bool: {
			var_symbol->u.value.type = bsl_variable_bool;
			break;
		}
		case bsl_db_register_type_string: {
			var_symbol->u.value.type = bsl_variable_string;
			break;
		}
		default: {
			break;
		}
	}
	
	bsl_db_register(variable.name, var_symbol, db->symtab);
}

bsl_database * bsl_db_create() {
	bsl_database *db = calloc(1, sizeof(bsl_database));
	
	if (db != NULL) {
		db->symtab = cmap_str_new();
		
		// register functions and variables
		
		bsl_register_func_item *func_item = GLOBAL_FUNCTIONS;
		uint32_t func_counter = 0;
		
		while (func_item[func_counter].rtype != bsl_db_register_type_invalid) {
			
			bsl_db_register_function(func_item[func_counter], db);
			
			func_counter++;
		}
		
#if USE_STD_LIB
		bsl_register_func_item *stdlib_func_item = STDLIB_FUNCTIONS;
		uint32_t stdlib_func_counter = 0;
		
		while (stdlib_func_item[stdlib_func_counter].rtype != bsl_db_register_type_invalid) {
			
			bsl_db_register_function(stdlib_func_item[stdlib_func_counter], db);
			
			stdlib_func_counter++;
		}
#endif
		
		
		
		bsl_register_var_item *var_item = GLOBAL_VARIABLES;
		uint32_t var_counter = 0;
		
		while (var_item[var_counter].type != bsl_db_register_type_invalid) {
			
			bsl_db_register_variable(var_item[var_counter], db);
			
			var_counter++;
		}
		
	}
	
	return db;
}

void bsl_db_release(bsl_database *db) {
	if (db->symtab) {
		cmap_str_free(db->symtab);
	}
	
	free(db);
}

bsl_symbol * bsl_db_lookup(char *name, cmap_str symtab) {
	return cmap_str_objectForKey(symtab, name);
}

bsl_symbol * bsl_db_get_symbol(char *name, cmap_str symtab) {
	bsl_symbol *symbol = NULL;
	
	if (symtab != NULL) {
		bsl_symbol *sym = bsl_db_lookup(name, symtab);
		
		if (sym != NULL) {
			symbol = sym;
		}
	}
	
	return symbol;
}

bsl_symbol * bsl_db_get_global(char *name, bsl_context *context) {
	return bsl_db_get_symbol(name, context->global->symtab);
}

bsl_symbol * bsl_db_get_state(char *name, bsl_context *context) {
	return bsl_db_get_symbol(name, context->stack->active->symtab);
}

void bsl_db_register_global(char *name, bsl_symbol *symbol, bsl_context *context) {
	if (context->global != NULL) {
		bsl_db_register(name, symbol, context->global->symtab);
	}
}

void bsl_db_register_state(char *name, bsl_symbol *symbol, bsl_context *context) {
	if (context->stack->active->symtab != NULL) {
		bsl_db_register(name, symbol, context->stack->active->symtab);
	}
}