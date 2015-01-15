//
//  BSLExecute.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLExecute__
#define __bsl_parse__BSLExecute__

#include "BSLPrivate.h"

int bsl_symbol_execute(char *name, bsl_context *context);

void bsl_execute_interpreted_code(bsl_interpreted_code code, bsl_context **context);

int bsl_symbol_parse_evaluate_symbol(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count);

int bsl_symbol_parse_evaluate(bsl_context **context, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count);

bsl_variable * bsl_symbol_make_call(bsl_context **context, bsl_symbol *symbol);

bsl_variable * bsl_symbol_parse_call_symbol(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count);

bsl_variable * bsl_symbol_parse_call(bsl_context **context, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count);

#endif /* defined(__bsl_parse__BSLExecute__) */
