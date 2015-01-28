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

STDLIB_FUNC_DEC bsl_variable * stdlib_parse(STDLIB_FUNC_ARG bsl_context **context, STDLIB_FUNC_ARG bsl_symbol *symbol, STDLIB_FUNC_ARG bsl_func_rtype rtype, STDLIB_FUNC_ARG bsl_func_arg *args, STDLIB_FUNC_ARG uint32_t arg_count) STDLIB_FUNC_IMP;

// Mathematical Functions

// Multiply
STDLIB_FUNC_DEC bsl_variable * stdlib_multiply_int(STDLIB_FUNC_ARG bsl_context **context, STDLIB_FUNC_ARG bsl_symbol *symbol, STDLIB_FUNC_ARG bsl_func_rtype rtype, STDLIB_FUNC_ARG bsl_func_arg *args, STDLIB_FUNC_ARG uint32_t arg_count) STDLIB_FUNC_IMP;
STDLIB_FUNC_DEC bsl_variable * stdlib_multiply_float(STDLIB_FUNC_ARG bsl_context **context, STDLIB_FUNC_ARG bsl_symbol *symbol, STDLIB_FUNC_ARG bsl_func_rtype rtype, STDLIB_FUNC_ARG bsl_func_arg *args, STDLIB_FUNC_ARG uint32_t arg_count) STDLIB_FUNC_IMP;
// Divide
STDLIB_FUNC_DEC bsl_variable * stdlib_divide_int(STDLIB_FUNC_ARG bsl_context **context, STDLIB_FUNC_ARG bsl_symbol *symbol, STDLIB_FUNC_ARG bsl_func_rtype rtype, STDLIB_FUNC_ARG bsl_func_arg *args, STDLIB_FUNC_ARG uint32_t arg_count) STDLIB_FUNC_IMP;
STDLIB_FUNC_DEC bsl_variable * stdlib_divide_float(STDLIB_FUNC_ARG bsl_context **context, STDLIB_FUNC_ARG bsl_symbol *symbol, STDLIB_FUNC_ARG bsl_func_rtype rtype, STDLIB_FUNC_ARG bsl_func_arg *args, STDLIB_FUNC_ARG uint32_t arg_count) STDLIB_FUNC_IMP;


// General Purpose

// Print
STDLIB_FUNC_DEC bsl_variable * stdlib_print(STDLIB_FUNC_ARG bsl_context **context, STDLIB_FUNC_ARG bsl_symbol *symbol, STDLIB_FUNC_ARG bsl_func_rtype rtype, STDLIB_FUNC_ARG bsl_func_arg *args, STDLIB_FUNC_ARG uint32_t arg_count) STDLIB_FUNC_IMP;
STDLIB_FUNC_DEC bsl_variable * stdlib_println(STDLIB_FUNC_ARG bsl_context **context, STDLIB_FUNC_ARG bsl_symbol *symbol, STDLIB_FUNC_ARG bsl_func_rtype rtype, STDLIB_FUNC_ARG bsl_func_arg *args, STDLIB_FUNC_ARG uint32_t arg_count) STDLIB_FUNC_IMP;


static bsl_register_func_item STDLIB_FUNCTIONS[] = {
	{"mul", bsl_db_register_type_int, "(int a, int b)", stdlib_multiply_int, stdlib_parse},
	{"mulf", bsl_db_register_type_float, "(float a, float b)", stdlib_multiply_float, stdlib_parse},
	{"div", bsl_db_register_type_int, "(int a, int b)", stdlib_divide_int, stdlib_parse},
	{"divf", bsl_db_register_type_float, "(float a, float b)", stdlib_divide_float, stdlib_parse},
	
	{"print", bsl_db_register_type_void, "(string a)", stdlib_print, stdlib_parse},
	{"println", bsl_db_register_type_void, "(string a)", stdlib_println, stdlib_parse},
	NULL
};

#endif /* defined(__bsl_parse__BSL_stdlib__) */
