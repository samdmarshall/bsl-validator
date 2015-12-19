//
//  BSLStack.c
//  bsl-parse
//
//  Created by Samantha Marshall on 12/29/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#include "BSLStack.h"
#include "BSLDatabase.h"
#include "BSLSymbol.h"

void bsl_frame_init(bsl_frame *stack_frame)
{
	stack_frame->symbol = NULL;
	stack_frame->symtab = cmap_str_new();
	
	stack_frame->ops = calloc(1, sizeof(bsl_stack_op));
	stack_frame->ops_count = 1;
	
	stack_frame->ops->statements = calloc(1, sizeof(bsl_symbol));
	stack_frame->ops->statement_count = 0;
}

void bsl_frame_release(bsl_frame *frame)
{
	if (frame != NULL) {

		for (uint32_t ops_index = 0; ops_index < frame->ops_count; ops_index++) {
			bsl_stack_op *op = &(frame->ops[ops_index]);
			
			if (op->statements != NULL) {
				free(op->statements);
			}
		}
		
		frame->symbol = NULL;

		if (frame->symtab != NULL) {
			cmap_str_free(frame->symtab);
		}
	}
}

void bsl_frame_increment(bsl_context *context, bsl_symbol *symbol)
{

	context->stack_pos += 1;
	context->stack[context->stack_pos].symbol = symbol;
}

void bsl_frame_decrement(bsl_context *context)
{

	bsl_frame *frame = &(context->stack[context->stack_pos]);

	bsl_frame_release(frame);

	bsl_frame_init(frame);

	context->stack_pos -= 1;
}

bsl_symbol *bsl_frame_search_scope(char *name, bsl_context *context)
{
	bsl_symbol *symbol = bsl_db_get_global(name, context);

	if (symbol == NULL) {

		symbol = bsl_db_get_symbol(name, context->stack[context->stack_pos].symtab);
	}

	return symbol;
}