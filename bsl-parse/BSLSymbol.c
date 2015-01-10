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

char * bsl_symbol_get_name(bsl_symbol *symbol) {
	char *result = calloc(1, sizeof(char));
	
	char *name = "";
	
	switch (symbol->type) {
		case bsl_symbol_type_variable: {
			name = symbol->u.value.name;
			break;
		}
		case bsl_symbol_type_function: {
			name = symbol->u.func.name;
			break;
		}
		case bsl_symbol_type_statement: {
			break;
		}
		default: {
			break;
		}
	}
	
	size_t length = strlen(name);
	result = realloc(result, sizeof(char) * (length + 1));
	strncpy(result, name, length);
	
	return result;
}

bsl_symbol * bsl_symbol_create(bsl_symbol_type type) {
	bsl_symbol *symbol = calloc(1, sizeof(bsl_symbol));
	
	if (symbol != NULL) {
		symbol->type = type;
	}
	
	return symbol;
}

void bsl_symbol_update_info(bsl_symbol *symbol, bsl_script_offset offset) {
	if (symbol != NULL) {
		symbol->script = offset.script;
		symbol->line = offset.line;
		symbol->index = offset.index;
	}
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