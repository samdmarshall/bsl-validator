//
//  BSLOperation.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/14/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLOperation.h"

bsl_operation * bsl_operation_create() {
	bsl_operation *op = calloc(1, sizeof(bsl_operation));
	
	if (op != NULL) {
		
	}
	
	return op;
}

void bsl_operation_release(bsl_operation *op) {
	if (op != NULL) {
		
		
		free(op);
	}
}