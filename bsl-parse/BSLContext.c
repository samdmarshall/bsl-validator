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
#include "BSLSymbol.h"
#include "BSLToken.h"

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
	
	bsl_symbol *symbol = context->stack->active->symbol;
	
	if (symbol == NULL) {
		
		if (context->error != bsl_error_none) {
			
			bsl_context_print_stack(context);
		}
		
		return context->error;
	}
	
	char *name = "";
	
	if (symbol->type == bsl_symbol_type_variable) {
		name = symbol->u.value.name;
	}
	if (symbol->type == bsl_symbol_type_function) {
		name = symbol->u.func.name;
	}
	
	switch (context->error) {
		case bsl_error_none: {
			break;
		}
		case bsl_error_invalid_identifier: {
			sprintf(message, "Invalid use of identifier \"%s\" at %s:%i", name, symbol->script->fd->name, symbol->line);
			break;
		}
		case bsl_error_reserved_word: {
			sprintf(message, "Use of reserved word at %s:%i", symbol->script->fd->name, symbol->line);
			break;
		}
		case bsl_error_invalid_scope: {
			sprintf(message, "Scoping error at %s:%i\n", symbol->script->fd->name, symbol->line);
			break;
		}
		case bsl_error_func_param_count: {
			sprintf(message, "Using more than 8 parameters in function signature at %s:%i\n", symbol->script->fd->name, symbol->line);
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
	bsl_token_check_scope_increase(&(context->scope_depth), item_token, BSLTokenCode_ctl_lbrace);
	bsl_token_check_scope_decrease(&(context->scope_depth), item_token, BSLTokenCode_ctl_rbrace);
	
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
	
	if (context->active_err == 1) {
		return;
	}
	
	printf("Error: printing current stack...\n");
	
	bsl_stack_scope *error = context->stack->active->prev;
	
	int8_t print_scope = 0;
	
	bsl_stack_scope *curr = context->stack->state;
	
	while (curr->next != NULL) {
		
		bsl_symbol *symbol = curr->symbol;
		
		if (symbol != NULL) {
			
			bsl_script *script = symbol->script;
			
			if (print_scope != curr->scope_depth) {
				
				char *name = bsl_symbol_get_name(symbol);
				
				if (script->fd == NULL) {
					printf("compiled func %s\n", name);
				}
				else {
					printf("%s:%i func %s\n", script->fd->name, symbol->line,name);
				}
				
				free(name);
				
				print_scope++;
			}
			
			if (curr == error) {
				
				if (script->fd != NULL) {
					printf("%s:%i", script->fd->name, symbol->line);
				}
				else {
					printf("compiled");
				}
				
				char *line = bsl_script_copy_line(script, error->symbol->index);
				printf(" -> \"%s\"\n", line);
				free(line);
			}
			
		}
		
		curr = curr->next;
	}
	
	context->active_err = 1;
}

void bsl_context_reset_error_state(bsl_context *context) {
	
	context->active_err = 0;
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