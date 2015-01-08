//
//  BSLStatement_Schedule.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Schedule.h"

bsl_statement_schedule bsl_statement_schedule_create(bsl_tkn_ir **token, bsl_context *context) {
	bsl_statement_schedule schedule = {};
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","schedule: ");
	
	bsl_tkn_ir *at = curr;
	// function call
	
	// 'at' identifier
	while (at != NULL) {
		
		if (at->token != NULL) {
			
			if (at->token->code == BSLTokenCode_id_at) {
				break;
			}
		}
		
		at = at->next;
	}
	
	if (at != NULL) {
		
		if (at->token->code == BSLTokenCode_id_at) {
			
			curr = at->next;
		}
	}
	else {
		// error, could not find keyword
	}
	
	// time value
	
	
	// move current position
	*token = curr;
	
	return schedule;
}