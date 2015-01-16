//
//  BSL_stdlib.h
//  bsl-parse
//
//  Created by Sam Marshall on 1/2/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSL_stdlib__
#define __bsl_parse__BSL_stdlib__

#include "BSLPrivate.h"

#define USE_STD_LIB 1

#if USE_STD_LIB
#define STDLIB_FUNC_DEC 
#define STDLIB_FUNC_IMP 
#else
#define STDLIB_FUNC_DEC static
#define STDLIB_FUNC_IMP { return NULL; }
#endif

STDLIB_FUNC_DEC bsl_variable * stdlib_parse(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) STDLIB_FUNC_IMP;

STDLIB_FUNC_DEC bsl_variable * stdlib_multiply_int(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) STDLIB_FUNC_IMP;
STDLIB_FUNC_DEC bsl_variable * stdlib_multiply_float(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) STDLIB_FUNC_IMP;

STDLIB_FUNC_DEC bsl_variable * stdlib_divide_int(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) STDLIB_FUNC_IMP;
STDLIB_FUNC_DEC bsl_variable * stdlib_divide_float(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) STDLIB_FUNC_IMP;

static bsl_register_func_item STDLIB_FUNCTIONS[] = {
	{"mul", bsl_db_register_type_int, "(int a, int b)", stdlib_parse, stdlib_multiply_int},
	{"mulf", bsl_db_register_type_float, "(float a, float b)", stdlib_parse, stdlib_multiply_float},
	{"div", bsl_db_register_type_int, "(int a, int b)", stdlib_parse, stdlib_divide_int},
	{"divf", bsl_db_register_type_float, "(float a, float b)", stdlib_parse, stdlib_divide_float},
	NULL
};

#endif /* defined(__bsl_parse__BSL_stdlib__) */
