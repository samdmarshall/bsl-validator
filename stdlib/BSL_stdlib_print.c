//
//  BSL_stdlib_print.c
//  bsl-parse
//
//  Created by Sam Marshall on 2/1/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSL_stdlib_print.h"
#include "BSLVariable.h"

#if USE_STD_LIB

bsl_variable *stdlib_print(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count)
{
	__attribute__((unused)) bsl_context *local_context = *context;
	__attribute__((unused)) bsl_symbol *local_symbol = symbol;
	__attribute__((unused)) uint32_t local_args_counts = arg_count;

	char *string = args[0].args[0].u.s;

	bsl_variable_type var_type = bsl_variable_type_from_func_rtype(rtype);

	bsl_variable *variable = bsl_variable_create_type(var_type);

	printf("%s", string);

	return variable;
}

bsl_variable *stdlib_println(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count)
{
	__attribute__((unused)) bsl_context *local_context = *context;
	__attribute__((unused)) bsl_symbol *local_symbol = symbol;
	__attribute__((unused)) uint32_t local_args_counts = arg_count;

	char *string = args[0].args[0].u.s;

	bsl_variable_type var_type = bsl_variable_type_from_func_rtype(rtype);

	bsl_variable *variable = bsl_variable_create_type(var_type);

	printf("%s\n", string);

	return variable;
}

#endif