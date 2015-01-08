//
//  BSLStatement_Var.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Var.h"

bsl_statement_var bsl_statement_var_create(bsl_tkn_ir **token, bsl_context *context, bsl_symbol *symbol) {
	bsl_statement_var var = {};
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","variable assignment: ");
	
	if (symbol != NULL) {
		
	}
	
	// move current position
	*token = curr;
	
	return var;
}