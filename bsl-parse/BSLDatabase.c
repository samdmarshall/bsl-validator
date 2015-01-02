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

void bsl_db_register(char *name, bsl_symbol *symbol, cmap_str symtab) {
	cmap_str_setObjectForKey(symtab, name, symbol);
}

bsl_database * bsl_db_create() {
	bsl_database *db = calloc(1, sizeof(bsl_database));
	
	if (db != NULL) {
		db->symtab = cmap_str_new();
		
		// register functions and variables
		
		bsl_register_func_item *func_item = GLOBAL_FUNCTIONS;
		uint32_t func_counter = 0;
		
		while (func_item[func_counter].rtype != bsl_db_register_type_invalid) {
			
			bsl_symbol *func_symbol = bsl_symbol_create(bsl_symbol_type_function);
			
			// func_symbol->u.func
			func_symbol->u.func.type = bsl_func_type_comp;
			
			switch (func_item[func_counter].rtype) {
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
			
			func_symbol->u.func.name = calloc(strlen(func_item[func_counter].name) + 1, sizeof(char));
			strncpy(func_symbol->u.func.name, func_item[func_counter].name, strlen(func_item[func_counter].name));

			
			bsl_tkn_ir *args = bsl_token_ir_generate_from_string(func_item[func_counter].args);
			
			bsl_tkn_ir *curr = args;
			
			while (curr != NULL) {
				if (curr == NULL || curr->token == NULL) {
					break;
				}
				
				if (curr->token->code == BSLTokenCode_id_void) {
					curr = curr->next;
				}
				else {
					func_symbol->u.func.args = realloc(func_symbol->u.func.args, sizeof(bsl_func_arg) * (func_symbol->u.func.arg_count + 1));
					bsl_tkn_ir *variable = curr;
					func_symbol->u.func.arg_count = bsl_func_arg_parse(&variable, NULL, &(func_symbol->u.func.args));
					curr = variable;
				}
			}
			
			func_symbol->u.func.u.comp.call = func_item[func_counter].call;
			
			bsl_db_register(func_item[func_counter].name, func_symbol, db->symtab);
			
			func_counter++;
		}
		
		
		bsl_register_var_item *var_item = GLOBAL_VARIABLES;
		uint32_t var_counter = 0;
		
		while (var_item[var_counter].type != bsl_db_register_type_invalid) {
			
			bsl_symbol *var_symbol = bsl_symbol_create(bsl_symbol_type_variable);
			
			
			var_symbol->u.value.name = calloc(strlen(var_item[var_counter].name) + 1, sizeof(char));
			strncpy(var_symbol->u.value.name, var_item[var_counter].name, strlen(var_item[var_counter].name));
			
			switch (var_item[var_counter].type) {
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
			
			bsl_db_register(var_item[var_counter].name, var_symbol, db->symtab);
			
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