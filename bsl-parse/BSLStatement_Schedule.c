//
//  BSLStatement_Schedule.c
//  bsl-parse
//
//  Created by Samantha Marshall on 1/8/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#include "BSLStatement_Schedule.h"
#include "BSLContext.h"
#include "BSLStatement_Func.h"
#include "BSLStatement_Sleep.h"
#include "BSLStatement_Fork.h"
#include "BSLParse.h"

bsl_statement_schedule bsl_statement_schedule_create(bsl_tkn_ir **token, bsl_context *context)
{
	bsl_statement_schedule schedule = {};

	bsl_tkn_ir *curr = (*token)->next;

	debug_printf("%s", "schedule: ");

	bsl_tkn_ir *keyword_token = curr;

	// 'at' identifier
	while (keyword_token != NULL) {

		if (keyword_token->token != NULL) {

			if (keyword_token->token->code == BSLTokenCode_id_at) {
				break;
			}

			if (keyword_token->token->code == BSLTokenCode_id_repeat) {
				bsl_tkn_ir *repeat = keyword_token;

				repeat = keyword_token->next;

				if (repeat->token != NULL) {

					if (repeat->token->code == BSLTokenCode_id_every) {
						break;
					}
					else {
						bsl_context_assign_error(context, bsl_error_invalid_identifier); // ERROR ASSIGNMENT
						break;
					}
				}
				else {
					bsl_context_assign_error(context, bsl_error_invalid_identifier); // ERROR ASSIGNMENT
					break;
				}
			}
		}

		keyword_token = keyword_token->next;
	}

	bsl_tkn_ir *func_ir = NULL;

	while (curr != keyword_token) {
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

	if (keyword_token != NULL) {

		if (keyword_token->token->code == BSLTokenCode_id_repeat) {
			keyword_token = keyword_token->next;

			schedule.repeats = 1;
		}

		if (keyword_token->token->code == BSLTokenCode_id_at || keyword_token->token->code == BSLTokenCode_id_every) {

			// time value
			schedule.sleep = bsl_statement_sleep_create(&keyword_token, context);
		}
	}
	else {
		// error, could not find keyword
		bsl_context_assign_error(context, bsl_error_missing_identifier); // ERROR ASSIGNMENT
	}

	bsl_context_check_error(context);

	// move current position
	*token = curr;

	return schedule;
}

void bsl_statement_schedule_action(bsl_context **context, bsl_statement *statement, bsl_script_offset offset)
{
	// this needs to happen asynchronously
	do {
		bsl_statement *sleep_statement = calloc(1, sizeof(bsl_statement));
		sleep_statement->type = bsl_statement_type_sleep;
		sleep_statement->u.sleep = statement->u.schedule.sleep;
		bsl_statement_sleep_action(context, sleep_statement, offset);
		free(sleep_statement);

		if (bsl_context_check_error(*context) != bsl_error_none) {
			break;
		}

		bsl_statement *fork_statement = calloc(1, sizeof(bsl_statement));
		fork_statement->type = bsl_statement_type_fork;
		fork_statement->u.fork = statement->u.schedule.fork;
		bsl_statement_fork_action(context, fork_statement, offset);
		free(fork_statement);

		if (bsl_context_check_error(*context) != bsl_error_none) {
			break;
		}

	} while (statement->u.schedule.repeats);
}
