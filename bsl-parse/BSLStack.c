//
//  BSLStack.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/29/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLStack.h"

bsl_stack_scope * bsl_stack_scope_create() {
	bsl_stack_scope *scope = calloc(1, sizeof(bsl_stack_scope));
	
	if (scope != NULL) {
		scope->symtab = cmap_str_new();
	}
	
	return scope;
}

void bsl_stack_scope_release(bsl_stack_scope *scope) {
	if (scope != NULL) {
		
		if (scope->symtab != NULL) {
			cmap_str_free(scope->symtab);
		}
		
		if (scope->next != NULL) {
			bsl_stack_scope_release(scope->next);
		}
		
		scope->prev->next = NULL;
		
		free(scope);
	}
}

bsl_stack * bsl_stack_create() {
	bsl_stack *stack = calloc(1, sizeof(bsl_stack));
	
	if (stack != NULL) {
		stack->state = bsl_stack_scope_create();
		stack->active = stack->state;
	}
	
	return stack;
}

void bsl_stack_release(bsl_stack *stack) {
	if (stack != NULL) {
		if (stack->state != NULL) {
			bsl_stack_scope_release(stack->state);
		}
		
		free(stack);
	}
}