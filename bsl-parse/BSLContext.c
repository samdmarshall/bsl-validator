//
//  BSLContext.c
//  bsl-parse
//
//  Created by Samantha Marshall on 12/27/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#include "BSLContext.h"
#include "BSLStack.h"
#include "BSLScript.h"
#include "BSLSymbol.h"
#include "BSLToken.h"
#include "BSLExecute.h"

bsl_context *bsl_context_create()
{
	bsl_context *context = (bsl_context *)calloc(1, sizeof(bsl_context));

	if (context != NULL) {
		context->global = bsl_db_create();

		// register defaults
		for (uint8_t index = 0; index < kBSLStackFrameMaximum; index++) {
			bsl_frame *stack = &(context->stack[index]);
			bsl_frame_init(stack);
		}

		context->stack_pos = -1;
		
		context->tasks = (bsl_task *)calloc(1, sizeof(bsl_task));
		context->task_count = 0;
	}

	return context;
}

int bsl_context_check_error(bsl_context *context)
{
	char message[1024] = {0};

	bsl_symbol *symbol = NULL;
	
	if (context->stack_pos > -1) {
		symbol = context->stack[context->stack_pos].symbol;
	}

	if (symbol == NULL) {

		if (context->error != bsl_error_none) {

			bsl_context_print_stack(context);
		}

		return context->error;
	}

	char *name = "";

	if (symbol->type == bsl_symbol_type_variable) {
		name = symbol->u.value.name;
	}
	if (symbol->type == bsl_symbol_type_function) {
		name = symbol->u.func.name;
	}

	char *script_name = (char *)(symbol->script->fd != NULL ? symbol->script->fd->name : "global");

	switch (context->error) {
		case bsl_error_none: {
			break;
		}
		case bsl_error_registered_symbol: {
			sprintf(message, "Duplicate symbol \"%s\", originally defined", name);
			break;
		}
		case bsl_error_token_invalid_string: {
			break;
		}
		case bsl_error_token_invalid_syntax: {
			break;
		}
		case bsl_error_invalid_identifier: {
			sprintf(message, "Invalid use of identifier \"%s\"", name);
			break;
		}
		case bsl_error_reserved_word: {
			sprintf(message, "Use of reserved word");
			break;
		}
		case bsl_error_invalid_scope: {
			sprintf(message, "Scoping error");
			break;
		}
		case bsl_error_missing_identifier: {
			sprintf(message, "Missing identifier");
			break;
		}
		case bsl_error_missing_initializer: {
			sprintf(message, "Missing function 'main'");
			break;
		}
		case bsl_error_invalid_sleep_use: {
			sprintf(message, "Cannot use 'sleep' in functions that return a value");
			break;
		}
		case bsl_error_sleep_failure: {
			sprintf(message, "Failed to sleep, error with select()");
			break;
		}
		case bsl_error_func_param_count_max: {
			sprintf(message, "Using more than 8 parameters in function signature");
			break;
		}
		case bsl_error_func_param_count_overload: {
			sprintf(message, "Cannot overload function arguments");
			break;
		}
		case bsl_error_invalid_parameter_type: {
			sprintf(message, "Mismatch of passed parameter types to \"%s\"", name);
			break;
		}
		case bsl_error_unsafe_evaluation: {
			sprintf(message, "Unsafe evaluation!");
			break;
		}
		case bsl_error_overflow_error: {
			sprintf(message, "Multiple errors have occured!");
			break;
		}
		default: {
			sprintf(message, "Unknown Error Code <%i>", context->error);
			break;
		}
	}
	
	if (message[0] != 0 && context->active_err == 0) {
		if (strcmp(script_name, "global") == 0) {
			printf("\n%s\n", message);
		}
		else {
			printf("\n%s in %s:%i\n", message, script_name, symbol->line);
		}

		bsl_context_print_stack(context);
	}

	if (context->active_err == 1) {
		bsl_context_assign_error(context, bsl_error_overflow_error);
	}

	return context->error;
}

bsl_context *bsl_context_update(bsl_context *context, bsl_token *item_token)
{
	bsl_token_check_scope_increase(context, &(context->scope_depth), item_token, BSLTokenCode_ctl_lbrace);
	bsl_token_check_scope_decrease(context, &(context->scope_depth), item_token, BSLTokenCode_ctl_rbrace);

	if (context->scope_depth < 0) {
		// throw error
		bsl_context_assign_error(context, bsl_error_invalid_scope); // ERROR ASSIGNMENT
	}
	else {
		switch (context->scope_depth) {
			case 0: {
				context->curr_scope = BSLScope_global;
				break;
			}
			case 1: {
				context->curr_scope = BSLScope_func;
				break;
			}
			default: {
				context->curr_scope = BSLScope_cond;
				break;
			}
		}
	}

	return context;
}

void bsl_context_print_stack(bsl_context *context)
{

	if (context->active_err == 1) {
		return;
	}

	printf("Error: printing current stack...\n");

	int8_t counter = -1;

	while (counter < context->stack_pos) {
		counter++;

		bsl_symbol *symbol = context->stack[counter].symbol;

		if (symbol != NULL) {

			bsl_script *script = symbol->script;

			char *name = bsl_symbol_get_name(symbol);

			if (script->fd == NULL) {
				printf("compiled: func %s\n", name);
			}
			else {

				if (strcmp(name, "") != 0) {
					printf("%s:%i func %s\n", script->fd->name, symbol->line, name);

					unsigned long name_length = strlen(script->fd->name);
					char *name_space = (char *)calloc(1 + name_length, sizeof(char));
					memset(name_space, ' ', sizeof(char[name_length]));

					bsl_frame *current_stack = &(context->stack[counter]);
					bsl_stack_op *exec_op = &(current_stack->ops[current_stack->exec_op]);
					int calling_line = exec_op->statements[(exec_op->statement_count - 1)].line;

					printf("%s:%i\n", name_space, calling_line);

					free(name_space);
				}
			}

			free(name);

			if (counter == context->stack_pos) {

				bsl_frame *current_stack = &(context->stack[counter]);
				bsl_stack_op *exec_op = &(current_stack->ops[current_stack->exec_op]);
				
				if (exec_op->statement_count > 0) {

					symbol = &(exec_op->statements[exec_op->statement_count - 1]);
				}

				bsl_symbol_print_frame(symbol);
			}
		}
	}

	context->active_err = 1;
}

void bsl_context_reset_error_state(bsl_context *context)
{

	context->active_err = 0;
}

void bsl_context_release(bsl_context *context)
{
	if (context) {
		if (context->global) {
			bsl_db_release(context->global);
		}

		free(context);
	}
}

void bsl_context_assign_error(bsl_context *context, bsl_error error)
{
	context->error = error;
}

void bsl_context_add_task(bsl_context **context, bsl_symbol *task)
{
	bsl_context *tmp = (*context);
	
	tmp->task_count += 1;
	tmp->tasks = (bsl_task *)realloc(tmp->tasks, sizeof(bsl_task) * (tmp->task_count));
	
	bsl_task *ctx_task = &(tmp->tasks[tmp->task_count - 1]);
	ctx_task->current_statement_index = 0;
	
	switch (task->type) {
		case bsl_symbol_type_variable: {
			ctx_task->statements = (bsl_symbol *)calloc(1, sizeof(bsl_symbol));
			ctx_task->statement_count = 1;
			break;
		}
		case bsl_symbol_type_function: {
			if (task->u.func.type == bsl_func_type_interp) {
				bsl_task *new_task = bsl_generate_statements_from_interpreted_code(task->u.func.u.interp.code, context);
				memcpy(ctx_task, new_task, sizeof(bsl_task));
				free(new_task);
			}
			else {
				ctx_task->statements = (bsl_symbol *)calloc(1, sizeof(bsl_symbol));
				ctx_task->statement_count = 1;
			}
			break;
		}
		case bsl_symbol_type_statement: {
			ctx_task->statements = (bsl_symbol *)calloc(1, sizeof(bsl_symbol));
			ctx_task->statement_count = 1;
			break;
		}
		default: {
			break;
		}
	}
	
}

void bsl_context_update_tasks(bsl_context **context)
{
	for (uint32_t index = 0; index < (*context)->task_count; index++) {
		
	}
}

int8_t bsl_context_finished_tasks(bsl_context *context)
{
	int8_t finished = 0;
	
	int8_t prev_finished = 1;
	
	for (uint32_t index = 0; index < context->task_count; index++) {
		bsl_task *task = &(context->tasks[index]);
		
		int8_t current_finished = (task->current_statement_index >= task->statement_count);
		finished = (current_finished == 1 && prev_finished == 1);
		
		prev_finished = (prev_finished == 0 ? 0 : current_finished);
	}
	
	return finished;
}
