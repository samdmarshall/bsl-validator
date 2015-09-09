//
//  BSL_stdlib_strlen.h
//  bsl-parse
//
//  Created by Samantha Marshall on 2/24/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSL_stdlib_strlen__
#define __bsl_parse__BSL_stdlib_strlen__

#include "BSL_stdlib_priv.h"

#if USE_STD_LIB

// strlen
STDLIB_FUNC_DEC bsl_variable *stdlib_strlen(STDLIB_FUNC_ARG bsl_context **context, STDLIB_FUNC_ARG bsl_symbol *symbol, STDLIB_FUNC_ARG bsl_func_rtype rtype, STDLIB_FUNC_ARG bsl_func_arg *args, STDLIB_FUNC_ARG uint32_t arg_count) STDLIB_FUNC_IMP;

#endif

#endif /* defined(__bsl_parse__BSL_stdlib_strlen__) */
