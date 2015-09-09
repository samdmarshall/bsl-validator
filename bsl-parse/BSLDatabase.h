//
//  BSLDatabase.h
//  bsl-parse
//
//  Created by Samantha Marshall on 12/27/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLDatabase__
#define __bsl_parse__BSLDatabase__

#include "BSLPrivate.h"

bsl_database *bsl_db_create();

void bsl_db_release(bsl_database *db);

bsl_symbol *bsl_db_get_symbol(char *name, cmap_str symtab);

// register a globally accessible function
void bsl_db_register_function(bsl_register_func_item function, bsl_database *db);
// register a globally accessible variable
void bsl_db_register_variable(bsl_register_var_item variable, bsl_database *db);

// get a symbol back from global symbol space
bsl_symbol *bsl_db_get_global(char *name, bsl_context *context);

// get a symbol back from current stack state
bsl_symbol *bsl_db_get_state(char *name, bsl_context *context);

// register a symbol by name to global space
void bsl_db_register_global(char *name, bsl_symbol *symbol, bsl_context *context);

void bsl_db_register_state(char *name, bsl_symbol *symbol, bsl_context *context);

#endif /* defined(__bsl_parse__BSLDatabase__) */
