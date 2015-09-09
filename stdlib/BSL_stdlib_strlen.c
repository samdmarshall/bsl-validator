//
//  BSL_stdlib_strlen.c
//  bsl-parse
//
//  Created by Samantha Marshall on 2/24/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#include "BSL_stdlib_strlen.h"
#include "BSLVariable.h"

#if USE_STD_LIB

bsl_variable *stdlib_strlen(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count)
{
	__attribute__((unused)) bsl_context *local_context = *context;
	__attribute__((unused)) bsl_symbol *local_symbol = symbol;
	__attribute__((unused)) uint32_t local_args_counts = arg_count;

	char *string = args[0].args[0].u.s;

	bsl_variable_type var_type = bsl_variable_type_from_func_rtype(rtype);

	bsl_variable *variable = bsl_variable_create_type(var_type);

	variable->u.i = (int)strlen(string);

	return variable;
}

#endif