//
//  BSL_stdlib.h
//  bsl-parse
//
//  Created by Sam Marshall on 1/2/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSL_stdlib__
#define __bsl_parse__BSL_stdlib__

#include "BSL_stdlib_mul.h"
#include "BSL_stdlib_div.h"
#include "BSL_stdlib_print.h"

#if USE_STD_LIB

STDLIB_FUNC_DEC bsl_variable * stdlib_parse(STDLIB_FUNC_ARG bsl_context **context, STDLIB_FUNC_ARG bsl_symbol *symbol, STDLIB_FUNC_ARG bsl_func_rtype rtype, STDLIB_FUNC_ARG bsl_func_arg *args, STDLIB_FUNC_ARG uint32_t arg_count) STDLIB_FUNC_IMP;


static bsl_register_func_item STDLIB_FUNCTIONS[] = {
	{"mul", bsl_db_register_type_int, "(int a, int b)", stdlib_multiply_int, stdlib_parse},
	{"mulf", bsl_db_register_type_float, "(float a, float b)", stdlib_multiply_float, stdlib_parse},
	{"div", bsl_db_register_type_int, "(int a, int b)", stdlib_divide_int, stdlib_parse},
	{"divf", bsl_db_register_type_float, "(float a, float b)", stdlib_divide_float, stdlib_parse},
	
	{"print", bsl_db_register_type_void, "(string a)", stdlib_print, stdlib_parse},
	{"println", bsl_db_register_type_void, "(string a)", stdlib_println, stdlib_parse},
	NULL
};

#endif

#endif /* defined(__bsl_parse__BSL_stdlib__) */
