//
//  BSLStatement_Fork.c
//  bsl-parse
//
//  Created by Samantha Marshall on 1/8/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#include "BSLStatement_Fork.h"

#include "BSLStatement_Func.h"
#include "BSLContext.h"

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
		bsl_context_assign_error(context, bsl_error_missing_identifier); // ERROR ASSIGNMENT
	}

	// move current position
	*token = curr;

	return fork;
}

void bsl_statement_fork_action(bsl_context **context, bsl_statement *statement, bsl_script_offset offset)
{
	// this needs to snapshot the stack or this is going to execute synchronously
	bsl_statement *func_statement = calloc(1, sizeof(bsl_statement));
	func_statement->type = bsl_statement_type_func;
	func_statement->u.func = statement->u.fork.function;
	bsl_statement_func_action(context, func_statement, offset);
	free(func_statement);
}