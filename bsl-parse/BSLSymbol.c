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
#include "BSLScript.h"

bsl_script_offset bsl_script_offset_from_symbol(bsl_symbol *symbol)
{
	bsl_script_offset offset = {
		.script = symbol->script,
		.line = symbol->line,
		.index = symbol->index};
	return offset;
}

void bsl_symbol_duplicate_description(bsl_symbol *parsed, bsl_symbol *original)
{
	char *parsed_name = "";
	if (parsed->type == bsl_symbol_type_variable) {
		parsed_name = parsed->u.value.name;
	}
	if (parsed->type == bsl_symbol_type_function) {
		parsed_name = parsed->u.func.name;
	}

	char *script_name = parsed->script->fd != NULL ? parsed->script->fd->name : "global";

	char *original_type = "";
	if (original->type == bsl_symbol_type_function) {
		original_type = "function";
	}
	if (original->type == bsl_symbol_type_variable) {
		original_type = "variable";
	}

	char *original_name = "";
	if (original->type == bsl_symbol_type_variable) {
		original_name = original->u.value.name;
	}
	if (original->type == bsl_symbol_type_function) {
		original_name = original->u.func.name;
	}

	printf("\n\nFound symbol with name \"%s\" at %s:%i, name used by (%s) \"%s\" already\n", parsed_name, script_name, parsed->line, original_type, original_name);
}

char *bsl_symbol_get_name(bsl_symbol *symbol)
{
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

bsl_symbol *bsl_symbol_create(bsl_symbol_type type)
{
	bsl_symbol *symbol = calloc(1, sizeof(bsl_symbol));

	if (symbol != NULL) {
		symbol->type = type;
	}

	return symbol;
}

void bsl_symbol_update_info(bsl_symbol *symbol, bsl_script_offset offset)
{
	if (symbol != NULL) {
		symbol->script = offset.script;
		symbol->line = offset.line;
		symbol->index = offset.index;
	}
}

void bsl_symbol_release(bsl_symbol *symbol)
{
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

void bsl_symbol_print_frame(bsl_symbol *symbol)
{

	bsl_script *script = symbol->script;

	if (script->fd != NULL) {
		printf("%s:%i -> ", script->fd->name, symbol->line);
	}
	else {
		char *symbol_name = bsl_symbol_get_name(symbol);
		printf("compiled: %s", symbol_name);
		free(symbol_name);
	}

	char *func_line = bsl_script_copy_line(script, symbol->index);
	printf("%s\n", func_line);
	free(func_line);
}