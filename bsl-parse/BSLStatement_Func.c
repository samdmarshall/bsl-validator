//
//  BSLStatement_Func.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Func.h"
#include "BSLExecute.h"
#include "BSLVariable.h"

bsl_statement_func bsl_statement_func_create(bsl_tkn_ir **token, bsl_context *context) {
	bsl_statement_func func = {};
	
	bsl_symbol *symbol = context->stack->active->symbol;
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","function call: ");
	
	bsl_func_arg *args = calloc(symbol->u.func.arg_count, sizeof(bsl_func_arg));
	uint32_t arg_count = symbol->u.func.arg_count;
	
	uint32_t counter = 0;
	while (counter < arg_count && curr->token != NULL) {
		args[counter].arg_type_count = 1;
		args[counter].args = bsl_variable_func_arg_parse(&curr, context);
		
		counter++;
	}
	counter--;
	
	for (uint32_t index = counter; index < arg_count; index++) {
		args[index].args = calloc(1, sizeof(bsl_variable));
		args[index].arg_type_count = 1;
		
		memcpy(args[index].args, symbol->u.func.args[index].args, sizeof(bsl_variable));
	}
	
	if (symbol != NULL) {
		
		context->stack->active->scope_level	= BSLScope_func;
		context->stack->active->scope_depth += 1;
		
		bsl_symbol_parse_call(&context, symbol->u.func.rtype, args, arg_count);
		
		
		context->stack->active->scope_depth -= 1;
	}

	// move current position
	*token = curr;
	
	return func;
}