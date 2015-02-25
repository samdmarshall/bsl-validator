//
//  BSLStatement_Sleep.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Sleep.h"
#include "BSLVariable.h"

#include <signal.h>
#include <time.h>
#include <errno.h>

bsl_statement_sleep bsl_statement_sleep_create(bsl_tkn_ir **token, bsl_context *context)
{
	bsl_statement_sleep sleep = {};

	bsl_tkn_ir *curr = *token;

	debug_printf("%s", "sleep: ");

	// advance to sleep value
	curr = curr->next;

	// add error checking here
	if (curr != NULL) {

		if (curr->token != NULL) {

			if (curr->token->code == BSLTokenCode_id_int || curr->token->code == BSLTokenCode_type_int) {

				bsl_variable *sleep_time = bsl_variable_create_from_token(curr->token, context);

				if (sleep_time != NULL) {

					float time = 0.f;

					switch (sleep_time->type) {
						case bsl_variable_float: {

							time = sleep_time->u.f;
							break;
						}
						case bsl_variable_int: {

							time = sleep_time->u.i;
							break;
						}
						default: {
							break;
						}
					}

					time = (time / 60.f);

					sleep.total.tv_sec = floorf(time);
					sleep.total.tv_usec = (time * kMicroseconds) - (sleep.total.tv_sec * kMicroseconds);

					debug_printf("%li seconds, %i microseconds, %ld frames\n", sleep.total.tv_sec, sleep.total.tv_usec, (sleep.total.tv_sec * 60) + (sleep.total.tv_usec / kMicrosecondsPerFrame));
				}
			}
			else {
				// there is an error in parsing
				context->error = bsl_error_missing_identifier; // ERROR ASSIGNMENT
			}
		}
	}
	else {
		// invalid syntax of `sleep`
		context->error = bsl_error_missing_identifier; // ERROR ASSIGNMENT
	}

	// move current position
	*token = curr;

	return sleep;
}

void bsl_statement_sleep_action(bsl_context **context, bsl_statement *statement, bsl_script_offset offset)
{
	ATR(unused) bsl_context *local_context = *context;
	ATR(unused) bsl_script_offset local_offset = offset;

	int result = -1;
	int select_errno = 0;
	uint8_t active = 1;

	do {
		result = select(0, NULL, NULL, NULL, &(statement->u.sleep.total));

		if (result < 0) {
			select_errno = errno;
		}
		else {
			active = 0;
		}

	} while (active == 1);

	if (result < 0) {
		(*context)->error = bsl_error_sleep_failure; // ERROR ASSIGNMENT
	}
}
