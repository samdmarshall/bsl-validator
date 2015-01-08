//
//  BSLStatement_Func.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Func.h"
#include "BSLExecute.h"

bsl_statement_func bsl_statement_func_create(bsl_tkn_ir **token, bsl_context *context, bsl_symbol *symbol) {
	bsl_statement_func func = {};
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","function call: ");
	
	if (symbol != NULL) {
		
		context->stack->active->scope_level	= BSLScope_func;
		context->stack->active->scope_depth += 1;
		
		bsl_symbol_parse_call(&context, symbol->u.func.rtype, symbol->u.func.args, symbol->u.func.arg_count);
		
		
		context->stack->active->scope_depth -= 1;
	}

	// move current position
	*token = curr;
	
	return func;
}