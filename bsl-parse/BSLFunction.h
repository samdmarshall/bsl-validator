//
//  BSLFunction.h
//  bsl-parse
//
//  Created by Samantha Marshall on 12/28/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLFunction__
#define __bsl_parse__BSLFunction__

#include "BSLPrivate.h"
#include "BSLContext.h"

bsl_function bsl_function_parse(bsl_tkn_ir **item, bsl_context *context);

bsl_variable *oni_call_non_op(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count);

void bsl_function_release(bsl_function func);

#endif /* defined(__bsl_parse__BSLFunction__) */
