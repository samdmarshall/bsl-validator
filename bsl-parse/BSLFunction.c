//
//  BSLFunction.c
//  bsl-parse
//
//  Created by Samantha Marshall on 12/28/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#include "BSLFunction.h"
#include "BSLVariable.h"
#include "BSLExpression.h"
#include "BSLExecute.h"

bsl_function bsl_function_parse(bsl_tkn_ir **item, bsl_context *context)
{
	bsl_function func = {0};

	// moving to the type identifier
	bsl_tkn_ir *curr = (*item)->next;

	func.type = (curr->token->offset.script->fd == NULL ? bsl_func_type_comp : bsl_func_type_interp);

	if (curr == NULL || curr->token == NULL) {
		bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
		return func;
	}
	
	// if the function definition is split over multiple lines, advance
	while (curr->token->code == BSLTokenCode_id_newline) {
		curr = curr->next;
	}

	// seems that there isn't support for return types
	if (curr->token->code != BSLTokenCode_id_generic) {
		// valid vunction definition

		switch (curr->token->code) {
			case BSLTokenCode_id_void: {
				func.rtype = bsl_func_rtype_void;
				break;
			}
			case BSLTokenCode_type_string:
			case BSLTokenCode_id_string: {
				func.rtype = bsl_func_rtype_string;
				break;
			}
			case BSLTokenCode_type_int:
			case BSLTokenCode_id_int: {
				func.rtype = bsl_func_rtype_int;
				break;
			}
			case BSLTokenCode_type_bool:
			case BSLTokenCode_id_bool: {
				func.rtype = bsl_func_rtype_bool;
				break;
			}
			case BSLTokenCode_type_float:
			case BSLTokenCode_id_float: {
				func.rtype = bsl_func_rtype_float;
				break;
			}
			default: {
				break;
			}
		}

		// advancing to function name
		curr = curr->next;

		if (curr == NULL || curr->token == NULL) {
			bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
			return func;
		}
	}
	else {
		func.rtype = bsl_func_rtype_void;
	}

	if (curr == NULL || curr->token == NULL) {
		bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
		return func;
	}
	
	// if the function definition is split over multiple lines, advance
	while (curr->token->code != BSLTokenCode_id_generic) {
		curr = curr->next;
	}

	// moving to the function name
	if (curr->token->code == BSLTokenCode_id_generic) {
		// function name
		func.name = calloc(curr->token->offset.length + 1, sizeof(char));
		strncpy(func.name, curr->token->contents, curr->token->offset.length);

		curr = curr->next;
	}

	if (curr == NULL || curr->token == NULL) {
		bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
		return func;
	}
	
	while (curr->token->code == BSLTokenCode_id_newline) {
		curr = curr->next;
	}

	// moving to the args
	if (curr->token->code == BSLTokenCode_ctl_lparen) {
		// found function args parens

		func.args = calloc(1, sizeof(bsl_func_arg));
		func.arg_count = 0;

		// advancing to next token
		curr = curr->next;
		while (curr->token->code == BSLTokenCode_id_newline) {
			curr = curr->next;
		}

		if (curr == NULL || curr->token == NULL) {
			bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
			return func;
		}

		while (curr->token->code != BSLTokenCode_ctl_rparen) {
			if (curr == NULL || curr->token == NULL) {
				bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
				return func;
			}

			if (curr->token->code == BSLTokenCode_id_void) {
				curr = curr->next;
				while (curr->token->code == BSLTokenCode_id_newline) {
					curr = curr->next;
				}

			}
			else {
				func.args = realloc(func.args, sizeof(bsl_func_arg) * (func.arg_count + 1));
				bsl_tkn_ir *variable = curr->prev;
				func.arg_count = bsl_func_arg_parse(&variable, context, &(func.args));
				curr = variable;
			}
		}

		// check number of args
	}

	while (curr->token->code != BSLTokenCode_ctl_lbrace) {
		curr = curr->next;

		if (curr == NULL || curr->token == NULL) {
			bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
			return func;
		}
	}

	if (curr->token->code == BSLTokenCode_ctl_lbrace) {
		// found start of function expressions

		func.u.interp.code.expression = calloc(1, sizeof(bsl_expression));
		func.u.interp.code.expression_count = 0;

		context = bsl_context_update(context, curr->token);
		curr = curr->next;

		if (curr == NULL || curr->token == NULL) {
			bsl_context_assign_error(context, bsl_error_token_invalid_syntax); // ERROR ASSIGNMENT
			return func;
		}

		while (context->curr_scope != BSLScope_global) {

			// add expressions here
			bsl_expression *expression = bsl_expression_parse(&curr, context);
			if (expression != NULL) {
				func.u.interp.code.expression = realloc(func.u.interp.code.expression, sizeof(bsl_expression) * (func.u.interp.code.expression_count + 1));
				memcpy(&(func.u.interp.code.expression[func.u.interp.code.expression_count]), expression, sizeof(bsl_expression));
				func.u.interp.code.expression_count += 1;
			}
			else {
				debug_printf("%s", "error\n");
			}

			if (curr->next == NULL) {
				break;
			}
			else {
				curr = curr->next;
				context = bsl_context_update(context, curr->token);
			}
		}
	}

	// end of evaluation line
	*item = curr;

	return func;
}

bsl_variable *oni_call_non_op(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count)
{
	bsl_variable *var = bsl_variable_create_type(bsl_variable_type_from_func_rtype(rtype));

	debug_printf("%s", "\n\t\tcalling into oni -> ");

	int mismatch_arg = bsl_symbol_parse_evaluate_symbol(context, symbol, rtype, args, arg_count);

	if (mismatch_arg != 0) {
		debug_printf(" -> error in %i total args!", mismatch_arg);
	}

	if ((*context)->stack[(*context)->stack_pos].symbol->type == bsl_symbol_type_function) {
		debug_printf("%s", "\n");
	}
	if ((*context)->stack[(*context)->stack_pos].symbol->type == bsl_symbol_type_variable) {
		debug_printf("%s", " -> ");
	}

	return var;
}

void bsl_function_release(bsl_function func)
{
	if (func.name) {
		free(func.name);
	}

	if (func.arg_count > 0) {
		for (uint32_t param_index = 0; param_index < func.arg_count; param_index++) {

			for (uint32_t arg_index = 0; arg_index < func.args[param_index].arg_type_count; arg_index++) {
				bsl_variable_release(func.args[param_index].args[arg_index]);
			}
		}

		free(func.args);
	}
}