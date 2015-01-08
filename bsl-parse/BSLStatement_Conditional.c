//
//  BSLStatement_Conditional.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Conditional.h"

bsl_statement_conditional bsl_statement_conditional_create(bsl_tkn_ir **token, bsl_context *context) {
	bsl_statement_conditional conditional = {};
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","conditional evaluation: ");
	
	// parse logic expression
	
	// scope (optional)
	
	// logical statement
	
	// else (if) (optional) repeat parsing ^^^
	
	// move current position
	*token = curr;
	
	return conditional;
}