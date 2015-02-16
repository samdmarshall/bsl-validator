//
//  BSL_stdlib.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/2/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSL_stdlib.h"
#include "BSLVariable.h"
#include "BSLExecute.h"

#if USE_STD_LIB

bsl_variable *stdlib_parse(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count)
{
	bsl_variable *var = bsl_variable_create_type(bsl_variable_type_from_func_rtype(rtype));

	debug_printf("%s", "\n\t\tcalling into stdlib -> ");

	int mismatch_arg = bsl_symbol_parse_evaluate_symbol(context, symbol, rtype, args, arg_count);

	if (mismatch_arg != 0) {
		debug_printf(" -> error in %i total args!", mismatch_arg);
	}

	if ((*context)->stack[(*context)->stack_pos].symbol->type == bsl_symbol_type_function) {
		debug_printf("%s", "\n");
	}
	if ((*context)->stack[(*context)->stack_pos].symbol->type == bsl_symbol_type_variable) {
		debug_printf("%s", " -> ");
	}

	FunctionPointer call = symbol->u.func.u.comp.parse;

	if (call != NULL && mismatch_arg == 0) {
		var = call(context, symbol, rtype, args, arg_count);
	}

	return var;
}

#endif