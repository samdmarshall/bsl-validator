//
//  BSLStatement_Iterate.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Iterate.h"

bsl_statement_iterate bsl_statement_iterate_create(bsl_tkn_ir **token, bsl_context *context) {
	bsl_statement_iterate iterate = {};
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","iterate: ");
	
	// 'over' identifier
	
	// variable identifier
	
	// 'using' identifier
	
	// variable identifier
	
	// scope { }
	
	// move current position
	*token = curr;
	
	return iterate;
}