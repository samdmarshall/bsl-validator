//
//  BSLStack.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/29/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLStack.h"

bsl_stack * bsl_stack_create() {
	bsl_stack *stack = calloc(1, sizeof(bsl_stack));
	
	if (stack != NULL) {
		
	}
	
	return stack;
}

void bsl_stack_release(bsl_stack *stack) {
	if (stack != NULL) {
		
		free(stack);
	}
}