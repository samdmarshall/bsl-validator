//
//  BSL_stdlib_print.h
//  bsl-parse
//
//  Created by Sam Marshall on 2/1/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSL_stdlib_print__
#define __bsl_parse__BSL_stdlib_print__

#include "BSL_stdlib_priv.h"

#if USE_STD_LIB

// Print
STDLIB_FUNC_DEC bsl_variable * stdlib_print(STDLIB_FUNC_ARG bsl_context **context, STDLIB_FUNC_ARG bsl_symbol *symbol, STDLIB_FUNC_ARG bsl_func_rtype rtype, STDLIB_FUNC_ARG bsl_func_arg *args, STDLIB_FUNC_ARG uint32_t arg_count) STDLIB_FUNC_IMP;
STDLIB_FUNC_DEC bsl_variable * stdlib_println(STDLIB_FUNC_ARG bsl_context **context, STDLIB_FUNC_ARG bsl_symbol *symbol, STDLIB_FUNC_ARG bsl_func_rtype rtype, STDLIB_FUNC_ARG bsl_func_arg *args, STDLIB_FUNC_ARG uint32_t arg_count) STDLIB_FUNC_IMP;

#endif

#endif /* defined(__bsl_parse__BSL_stdlib_print__) */
