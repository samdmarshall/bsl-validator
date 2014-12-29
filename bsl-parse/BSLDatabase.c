//
//  BSLDatabase.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLDatabase.h"


bsl_database * bsl_db_create() {
	bsl_database *db = calloc(1, sizeof(bsl_database));
	
	if (db != NULL) {
		db->symtab = cmap_str_new();
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

void bsl_db_register(char *name, bsl_symbol *symbol, cmap_str symtab) {
	cmap_str_setObjectForKey(symtab, name, symbol);
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
	return bsl_db_get_symbol(name, context->current->symtab);
}

void bsl_db_register_global(char *name, bsl_symbol *symbol, bsl_context *context) {
	if (context->global != NULL) {
		bsl_db_register(name, symbol, context->global->symtab);
	}
}