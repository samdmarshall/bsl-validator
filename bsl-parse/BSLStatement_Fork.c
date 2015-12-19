//
//  BSLStatement_Fork.c
//  bsl-parse
//
//  Created by Samantha Marshall on 1/8/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#include "BSLStatement_Fork.h"

#include "BSLStatement_Func.h"
#include "BSLContext.h"
#include "BSLSymbol.h"

bsl_statement_fork bsl_statement_fork_create(bsl_tkn_ir **token, bsl_context *context)
{
	bsl_statement_fork fork = {0};

	bsl_tkn_ir *curr = *token;

	debug_printf("%s", "fork: ");

	curr = curr->next;

	if (curr != NULL) {

		fork.function = bsl_statement_func_create(&curr, context);
	}
	else {
		// error
		bsl_context_assign_error(context, bsl_error_missing_identifier); // ERROR ASSIGNMENT
	}

	// move current position
	*token = curr;

	return fork;
}

void bsl_statement_fork_action(bsl_context **context, bsl_statement *statement, bsl_script_offset offset)
{
	
	bsl_frame *current_frame = &((*context)->stack[(*context)->stack_pos]);
	current_frame->ops_count += 1;
	bsl_stack_op *ops = current_frame->ops;
	ops = realloc(ops, sizeof(bsl_stack_op) * (current_frame->ops_count));
	bsl_stack_op *fork_op = &(ops[current_frame->ops_count - 1]);
	fork_op->statement_count = 1;
	
	bsl_symbol *call_symbol = bsl_symbol_create(bsl_symbol_type_function);
	call_symbol->u.func = statement->u.fork.function.function;
	bsl_symbol_update_info(call_symbol, offset);
	
	bsl_symbol *resolve_symbol = bsl_db_get_state(statement->u.fork.function.function.name, *context);
	if (resolve_symbol->type == bsl_symbol_type_function) {
		// check if interpreted
		if (resolve_symbol->u.func.type == bsl_func_type_interp) {
			// update the positioning for storing the next frame
			call_symbol->script = resolve_symbol->script;
			call_symbol->line = resolve_symbol->line;
			call_symbol->index = resolve_symbol->index;
		}
	}
	
	fork_op->statements = call_symbol;
	
	current_frame->ops = ops;
}