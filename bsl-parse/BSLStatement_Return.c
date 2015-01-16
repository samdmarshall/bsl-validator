//
//  BSLStatement_Return.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLStatement_Return.h"
#include "BSLVariable.h"

bsl_statement_return bsl_statement_return_create(bsl_tkn_ir **token, bsl_context *context) {
	bsl_statement_return ret = {0};
	
	bsl_tkn_ir *curr = *token;
	
	debug_printf("%s","return: ");
	
	curr = curr->next;
	
	if (curr != NULL && curr->token != NULL) {
		ret.variable = bsl_variable_create_from_token(curr->token, context);
	}
	else {
		ret.variable = bsl_variable_create_type(bsl_variable_void);
	}
	
	// return value, stop evaluating
	char *text = bsl_variable_print(*(ret.variable));
	debug_printf("value %s\n", text);
	free(text);
	
	// move current position
	*token = curr;
	
	return ret;
}