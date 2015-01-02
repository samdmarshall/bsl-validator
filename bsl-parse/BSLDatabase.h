//
//  BSLDatabase.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLDatabase__
#define __bsl_parse__BSLDatabase__

#include "BSLPrivate.h"

bsl_database * bsl_db_create();

void bsl_db_release(bsl_database *db);

void bsl_db_register_function(bsl_register_func_item function, bsl_database *db);
void bsl_db_register_variable(bsl_register_var_item variable, bsl_database *db);

bsl_symbol * bsl_db_get_global(char *name, bsl_context *context);

bsl_symbol * bsl_db_get_state(char *name, bsl_context *context);

void bsl_db_register_global(char *name, bsl_symbol *symbol, bsl_context *context);

#endif /* defined(__bsl_parse__BSLDatabase__) */
