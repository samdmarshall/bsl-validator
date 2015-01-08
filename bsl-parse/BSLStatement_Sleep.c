//
//  BSLStatement_Sleep.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Sleep.h"

bsl_statement_sleep bsl_statement_sleep_create(bsl_tkn_ir **token, bsl_context *context) {
	bsl_statement_sleep sleep = {};
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","sleep: ");
	
	if (curr->next == NULL) {
		// parse error
	}
	
	// advance to sleep value
	curr = curr->next;
	
	// remove this code and give to scheduler to run instead.
	
	// add error checking here
	
	if (curr->token->code == BSLTokenCode_id_int || curr->token->code == BSLTokenCode_type_int) {
		//				bsl_variable *sleep_time = bsl_variable_create_from_token(curr->token, context);
		//
		//				if (sleep_time != NULL) {
		//
		//					if (sleep_time->type == bsl_variable_int) {
		//						useconds_t time_val = (sleep_time->u.i / 60) * 1000;
		//
		//						usleep(time_val);
		//					}
		//					else {
		//						// error
		//					}
		//
		//					bsl_variable_release(*sleep_time);
		//				}
		
	}
	else {
		// there is an error in parsing
	}
	
	// move current position
	*token = curr;
	
	return sleep;
}