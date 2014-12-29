//
//  BSLContext.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLContext.h"
#include "BSLStack.h"

bsl_context * bsl_context_create() {
	bsl_context *context = calloc(1, sizeof(bsl_context));
	
	if (context != NULL) {
		context->global = bsl_db_create();
		context->stack = bsl_stack_create();
		
		// register defaults
		
	}
	
	return context;
}

int bsl_context_check_error(bsl_context *context) {
	char message[1024] = {0};
	switch (context->error) {
		case bsl_error_none: {
			break;
		}
		case bsl_error_invalid_identifier: {
			sprintf(message, "Unknown Error Code <%i>",context->error);
			break;
		}
		case bsl_error_reserved_word: {
			sprintf(message, "Unknown Error Code <%i>",context->error);
			break;
		}
		default: {
			sprintf(message, "Unknown Error Code <%i>",context->error);
			break;
		}
	}
	if (message[0] != 0) {
		printf("%s\n",message);
	}
	
	return context->error;
}

bsl_context * bsl_context_update(bsl_context *context, bsl_token *item_token) {
	switch (item_token->code) {
		case BSLTokenCode_ctl_lbrace: {
			context->scope_depth++;
			break;
		}
		case BSLTokenCode_ctl_rbrace: {
			context->scope_depth--;
			break;
		}
		default: {
			break;
		}
	}
	if (context->scope_depth < 0) {
		// throw error
		printf("scoping error!\n");
	}
	else {
		switch (context->scope_depth) {
			case 0: {
				context->curr_scope = BSLScope_global;
				break;
			}
			case 1: {
				context->curr_scope = BSLScope_func;
				break;
			}
			default: {
				context->curr_scope = BSLScope_cond;
				break;
			}
		}
	}
	return context;
}

void bsl_context_release(bsl_context *context) {
	if (context) {
		if (context->global) {
			bsl_db_release(context->global);
		}
		
		if (context->stack) {
			bsl_stack_release(context->stack);
		}
		
		free(context);
	}
}