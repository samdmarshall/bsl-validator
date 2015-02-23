//
//  BSLVariable.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLVariable__
#define __bsl_parse__BSLVariable__

#include "BSLPrivate.h"
#include "BSLContext.h"

int8_t bsl_variable_is_type_compatible(bsl_variable_type def, bsl_variable_type arg_type);

char *bsl_variable_print(bsl_variable variable);

bsl_variable *bsl_variable_create_type(bsl_variable_type type);

bsl_variable_type bsl_variable_type_from_func_rtype(bsl_func_rtype type);

bsl_variable_type bsl_variable_get_type(bsl_token_code code);

char *bsl_variable_get_type_name(bsl_variable_type type);

bsl_variable *bsl_variable_func_arg_parse(bsl_tkn_ir **item, bsl_context *context);

uint32_t bsl_func_arg_parse(bsl_tkn_ir **item, bsl_context *context, bsl_func_arg **f_args);

void bsl_variable_parse_assign(bsl_tkn_ir **item, bsl_context *context, bsl_variable *variable);

bsl_variable bsl_variable_parse(bsl_tkn_ir **item, bsl_context *context);

bsl_variable *bsl_variable_create_from_token(bsl_token *token, bsl_context *context);

void bsl_variable_set(bsl_variable *variable, bsl_variable *value);

void bsl_variable_release(bsl_variable variable);

#endif /* defined(__bsl_parse__BSLVariable__) */
