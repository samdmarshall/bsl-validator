//
//  BSLStatement_Fork.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Fork.h"

bsl_statement_fork bsl_statement_fork_create(bsl_tkn_ir **token, bsl_context *context) {
	bsl_statement_fork fork = {};
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","fork: ");
	
	if (curr->next == NULL) {
		// error
	}
	
	curr = curr->next;
	
	// do function on separate thread
	
	// move current position
	*token = curr;
	
	return fork;
}