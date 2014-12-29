//
//  BSLSymbol.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLSymbol.h"
#include "BSLVariable.h"
#include "BSLFunction.h"

bsl_symbol * bsl_symbol_create(bsl_symbol_type type) {
	bsl_symbol *symbol = calloc(1, sizeof(bsl_symbol));
	
	if (symbol != NULL) {
		symbol->type = type;
	}
	
	return symbol;
}

void bsl_symbol_release(bsl_symbol *symbol) {
	if (symbol) {
		switch (symbol->type) {
			case bsl_symbol_type_function: {
				bsl_function_release(symbol->u.func);
				break;
			}
			case bsl_symbol_type_variable: {
				bsl_variable_release(symbol->u.value);
				break;
			}
			default: {
				break;
			}
		}
		
		free(symbol);
	}
}