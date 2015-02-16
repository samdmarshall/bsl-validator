//
//  BSLStack.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/29/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLStack.h"
#include "BSLDatabase.h"
#include "BSLSymbol.h"

void bsl_stack_init(bsl_stack *stack_frame)
{
	stack_frame->symbol = NULL;
	stack_frame->symtab = cmap_str_new();

	stack_frame->statements = calloc(1, sizeof(bsl_symbol));
	stack_frame->statement_count = 0;
}

void bsl_stack_release(bsl_stack *frame)
{
	if (frame != NULL) {

		if (frame->statements != NULL) {
			free(frame->statements);
		}

		frame->symbol = NULL;

		if (frame->symtab != NULL) {
			cmap_str_free(frame->symtab);
		}
	}
}

void bsl_stack_increment(bsl_context *context, bsl_symbol *symbol)
{

	context->stack_pos += 1;
	context->stack[context->stack_pos].symbol = symbol;
}

void bsl_stack_decrement(bsl_context *context)
{

	bsl_stack *frame = &(context->stack[context->stack_pos]);

	bsl_stack_release(frame);

	bsl_stack_init(frame);

	context->stack_pos -= 1;
}

bsl_symbol *bsl_stack_search_scope(char *name, bsl_context *context)
{
	bsl_symbol *symbol = bsl_db_get_global(name, context);

	if (symbol == NULL) {

		symbol = bsl_db_get_symbol(name, context->stack[context->stack_pos].symtab);
	}

	return symbol;
}