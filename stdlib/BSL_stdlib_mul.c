//
//  BSL_stdlib_mul.c
//  bsl-parse
//
//  Created by Sam Marshall on 2/1/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSL_stdlib_mul.h"
#include "BSLVariable.h"

#if USE_STD_LIB

bsl_variable * stdlib_multiply_int(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) {
	__attribute__((unused)) bsl_context *local_context = *context;
	__attribute__((unused)) bsl_symbol *local_symbol = symbol;
	
	bsl_variable_type var_type = bsl_variable_type_from_func_rtype(rtype);
	
	bsl_variable *variable = bsl_variable_create_type(var_type);
	
	int a = 0;
	int b = 0;
	
	if (arg_count == 2) {
		a = args[0].args[0].u.i;
		b = args[1].args[0].u.i;
		
		variable->u.i = a * b;
	}
	else {
		variable->u.i = 0;
	}
	
	return variable;
}

bsl_variable * stdlib_multiply_float(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count) {
	__attribute__((unused)) bsl_context *local_context = *context;
	__attribute__((unused)) bsl_symbol *local_symbol = symbol;
	
	bsl_variable_type var_type = bsl_variable_type_from_func_rtype(rtype);
	
	bsl_variable *variable = bsl_variable_create_type(var_type);
	
	float a = 0;
	float b = 0;
	
	if (arg_count == 2) {
		a = args[0].args[0].u.f;
		b = args[1].args[0].u.f;
		
		variable->u.f = a * b;
	}
	else {
		variable->u.f = 0.f;
	}
	
	return variable;
}

#endif