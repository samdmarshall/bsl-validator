//
//  BSLContext.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLContext.h"
#include "BSLStack.h"
#include "BSLScript.h"

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
	
	if (context->stack->active->symbol == NULL) {
		
		if (context->error != bsl_error_none) {
			debug_printf("%s","implementation not finished yet, skipping error check!\n");
			
			bsl_context_print_stack(context);
		}
		
		return context->error;
	}
	
	char *name = "";
	if (context->stack->active->symbol->type == bsl_symbol_type_variable) {
		name = context->stack->active->symbol->u.value.name;
	}
	if (context->stack->active->symbol->type == bsl_symbol_type_function) {
		name = context->stack->active->symbol->u.func.name;
	}
	
	switch (context->error) {
		case bsl_error_none: {
			break;
		}
		case bsl_error_invalid_identifier: {
			sprintf(message, "Invalid use of identifier \"%s\" at %s:%i", name, context->stack->active->symbol->script->fd->name,context->stack->active->symbol->line);
			break;
		}
		case bsl_error_reserved_word: {
			sprintf(message, "Use of reserved word at %s:%i",context->stack->active->symbol->script->fd->name,context->stack->active->symbol->line);
			break;
		}
		case bsl_error_invalid_scope: {
			sprintf(message, "Scoping error at %s:%i\n",context->stack->active->symbol->script->fd->name,context->stack->active->symbol->line);
			break;
		}
		default: {
			sprintf(message, "Unknown Error Code <%i>",context->error);
			break;
		}
	}
	if (message[0] != 0) {
		printf("%s\n",message);
		
		bsl_context_print_stack(context);
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
		context->error = bsl_error_invalid_scope;
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

void bsl_context_print_stack(bsl_context *context) {
	printf("printing current stack...\n");
	
	bsl_stack_scope *curr = context->stack->state;
	
	while (curr->next != NULL) {
		
		bsl_symbol *symbol = curr->symbol;
		
		if (symbol != NULL) {
			
			bsl_script *script = symbol->script;
			
			if (script->fd == 0) {
				// compiled
				printf("compiled");
			}
			else {
				printf("%s:%i",script->fd->name,symbol->line);
			}
			
			char *line = bsl_script_copy_line(script, symbol->index);
			printf(" -> %s\n",line);
			free(line);
			
		}
		
		curr = curr->next;
	}
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