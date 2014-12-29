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

bsl_variable_type bsl_variable_get_type(bsl_token_code code);

uint32_t bsl_func_arg_parse(bsl_tkn_ir **item, bsl_context *context, bsl_func_arg **f_args);

bsl_variable bsl_variable_parse(bsl_tkn_ir **item, bsl_context *context);

void bsl_variable_release(bsl_variable variable);

#endif /* defined(__bsl_parse__BSLVariable__) */
