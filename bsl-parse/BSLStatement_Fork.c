//
//  BSLStatement_Fork.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Fork.h"

#include "BSLStatement_Func.h"

bsl_statement_fork bsl_statement_fork_create(bsl_tkn_ir **token, bsl_context *context)
{
	bsl_statement_fork fork = {0};

	bsl_tkn_ir *curr = *token;

	debug_printf("%s", "fork: ");

	curr = curr->next;

	if (curr != NULL) {

		fork.function = bsl_statement_func_create(&curr, context);
	}
	else {
		// error
		context->error = bsl_error_missing_identifier;
	}

	// move current position
	*token = curr;

	return fork;
}