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

int stdlib_multiply_int(int a, int b);
float stdlib_multiply_float(float a, float b);

static bsl_register_func_item STDLIB_FUNCTIONS[] = {
	{"mul", bsl_db_register_type_int, "int a, int b", stdlib_multiply_int},
	{"mulf", bsl_db_register_type_float, "float a, float b", stdlib_multiply_float},
	NULL
};

#endif /* defined(__bsl_parse__BSL_stdlib__) */
