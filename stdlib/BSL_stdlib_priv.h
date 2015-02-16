//
//  BSL_stdlib_priv.h
//  bsl-parse
//
//  Created by Sam Marshall on 2/1/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef bsl_parse_BSL_stdlib_priv_h
#define bsl_parse_BSL_stdlib_priv_h

#include "BSLPrivate.h"

#define USE_STD_LIB 0

#if USE_STD_LIB
#define STDLIB_FUNC_DEC
#define STDLIB_FUNC_IMP
#define STDLIB_FUNC_ARG
#else
#define STDLIB_FUNC_DEC static
#define STDLIB_FUNC_IMP { return NULL; }
#define STDLIB_FUNC_ARG __attribute__((unused))
#endif

#endif
