//
//  BSLStatement_Schedule.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Schedule.h"
#include "BSLContext.h"
#include "BSLStatement_Func.h"
#include "BSLStatement_Sleep.h"
#include "BSLParse.h"

bsl_statement_schedule bsl_statement_schedule_create(bsl_tkn_ir **token, bsl_context *context)
{
	bsl_statement_schedule schedule = {};

	bsl_tkn_ir *curr = (*token)->next;

	debug_printf("%s", "schedule: ");

	bsl_tkn_ir *at = curr;

	// 'at' identifier
	while (at != NULL) {

		if (at->token != NULL) {

			if (at->token->code == BSLTokenCode_id_at) {
				break;
			}
		}

		at = at->next;
	}

	bsl_tkn_ir *func_ir = NULL;

	while (curr != at) {
		if (func_ir == NULL) {
			func_ir = bsl_token_ir_copy(curr);
		}
		else {
			bsl_token_ir_append(&func_ir, curr);
		}

		curr = curr->next;
	}

	func_ir = bsl_token_ir_jump_head(func_ir);

	schedule.fork.function = bsl_statement_func_create(&func_ir, context);

	func_ir = bsl_token_ir_jump_head(func_ir);

	bsl_token_ir_release_sequence(func_ir);

	if (at != NULL) {

		if (at->token->code == BSLTokenCode_id_at) {

			// time value
			schedule.sleep = bsl_statement_sleep_create(&at, context);
		}
	}
	else {
		// error, could not find keyword
		context->error = bsl_error_token_invalid_syntax; // ERROR ASSIGNMENT
	}

	bsl_context_check_error(context);

	// move current position
	*token = curr;

	return schedule;
}