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

bsl_variable *stdlib_log(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count)
{
	__attribute__((unused)) bsl_context *local_context = *context;
	__attribute__((unused)) bsl_symbol *local_symbol = symbol;
	__attribute__((unused)) uint32_t local_args_counts = arg_count;

	bsl_variable_type var_type = bsl_variable_type_from_func_rtype(rtype);

	bsl_variable *variable = bsl_variable_create_type(var_type);

	bsl_variable *log_variable = &(args[0].args[0]);

	switch (log_variable->type) {
		case bsl_variable_int: {
			printf("%i", log_variable->u.i);
			break;
		}
		case bsl_variable_bool: {
			printf("%s", (log_variable->u.b == 1 ? "true" : "false"));
			break;
		}
		case bsl_variable_string: {
			printf("%s", log_variable->u.s);
			break;
		}
		case bsl_variable_float: {
			printf("%f", log_variable->u.f);
			break;
		}
		case bsl_variable_void: {
			printf("(null)");
			break;
		}
		default: {
			break;
		}
	}

	printf("\n");

	return variable;
}

#endif