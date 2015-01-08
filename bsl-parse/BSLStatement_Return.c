//
//  BSLStatement_Return.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Return.h"

bsl_statement_return bsl_statement_return_create(bsl_tkn_ir **token, bsl_context *context) {
	bsl_statement_return ret = {};
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","return: ");
	
	// return value, stop evaluating
	
	// move current position
	*token = curr;
	
	return ret;
}