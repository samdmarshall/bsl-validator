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

void bsl_stack_item_advance(bsl_stack_scope **scope, bsl_scope_type type, uint8_t depth) {
	// convenience call to advance the stack scope item sequence
	bsl_stack_scope *item = *scope;
	if (item != NULL) {
		item->next = bsl_stack_scope_create();
		item->next->scope_depth = depth;
		item->next->scope_level = type;
		item->next->prev = item;
		
		// passing next stack scope item back up out
		*scope = item->next;
	}
	else {
		*scope = item;
	}
}

void bsl_stack_release(bsl_stack *stack) {
	if (stack != NULL) {
		if (stack->state != NULL) {
			bsl_stack_scope_release(stack->state);
		}
		
		free(stack);
	}
}