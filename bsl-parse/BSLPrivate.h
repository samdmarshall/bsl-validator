//
//  BSLPrivate.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef bsl_parse_BSLPrivate_h
#define bsl_parse_BSLPrivate_h

#include "FileAccess.h"
#include "cmap.h"
#include "TimeUtil.h"

#include <ctype.h>
#include <math.h>

typedef struct bsl_script bsl_script;

typedef struct bsl_script_offset bsl_script_offset;

typedef struct bsl_token bsl_token;

typedef struct bsl_tkn_ir bsl_tkn_ir;

typedef struct bsl_expression bsl_expression;

typedef struct bsl_database bsl_database;
typedef struct bsl_register_func_item bsl_register_func_item;
typedef struct bsl_register_var_item bsl_register_var_item;

typedef struct bsl_variable bsl_variable;

typedef struct bsl_func_arg bsl_func_arg;
typedef struct bsl_interpreted_code bsl_interpreted_code;
typedef struct bsl_function_interpreted bsl_function_interpreted;
typedef struct bsl_function_compiled bsl_function_compiled;
typedef struct bsl_function bsl_function;

typedef struct bsl_symbol bsl_symbol;

typedef struct bsl_stack_scope bsl_stack_scope;

typedef struct bsl_stack bsl_stack;

typedef struct bsl_context bsl_context;

typedef struct bsl_statement bsl_statement;

typedef struct bsl_scheduler bsl_scheduler;

typedef struct bsl_schedule_item bsl_schedule_item;


typedef struct bsl_statement_schedule bsl_statement_schedule;

typedef struct bsl_statement_fork bsl_statement_fork;

typedef struct bsl_operation bsl_operation;
typedef struct bsl_conditional bsl_conditional;
typedef struct bsl_statement_conditional_case bsl_statement_conditional_case;
typedef struct bsl_statement_conditional bsl_statement_conditional;

typedef struct bsl_statement_return bsl_statement_return;

typedef struct bsl_statement_sleep bsl_statement_sleep;

typedef struct bsl_statement_iterate bsl_statement_iterate;

typedef struct bsl_statement_func bsl_statement_func;

typedef struct bsl_statement_var bsl_statement_var;

#if DEBUG
#define debug_printf(fmt, ...) printf(fmt, __VA_ARGS__)
#else
#define debug_printf(fmt, ...)
#endif

#pragma mark -
#pragma mark BSLScript

#pragma mark bsl_script

struct bsl_script {
	file_ref *fd;
	mem_buff *contents;
};

#pragma mark bsl_script_offset

struct bsl_script_offset {
	bsl_script *script;
	uint32_t line;
	uint32_t index;
	int16_t length;
} __attribute__((packed));

#pragma mark -
#pragma mark BSLToken

#pragma mark bsl_token_code

typedef enum bsl_token_code {
	BSLTokenCode_empty,
	
	BSLTokenCode_op_assign,
	BSLTokenCode_op_plus,
	BSLTokenCode_op_minus,
	BSLTokenCode_op_AND,
	BSLTokenCode_op_OR,
	BSLTokenCode_op_NOT,
	
	BSLTokenCode_cmp_eq,
	BSLTokenCode_cmp_ne,
	BSLTokenCode_cmp_lt,
	BSLTokenCode_cmp_gt,
	BSLTokenCode_cmp_le,
	BSLTokenCode_cmp_ge,
	
	BSLTokenCode_ctl_lparen,
	BSLTokenCode_ctl_rparen,
	BSLTokenCode_ctl_lbrace,
	BSLTokenCode_ctl_rbrace,
	BSLTokenCode_ctl_lbracket,
	BSLTokenCode_ctl_rbracket,
	BSLTokenCode_ctl_semicolon,
	BSLTokenCode_ctl_colon,
	BSLTokenCode_ctl_comma,
	
	BSLTokenCode_bar,
	
	BSLTokenCode_type_int,
	BSLTokenCode_type_bool,
	BSLTokenCode_type_float,
	BSLTokenCode_type_string,
	
	BSLTokenCode_type_func,
	BSLTokenCode_type_var,
	
	BSLTokenCode_id_schedule,
	BSLTokenCode_id_iterate,
	BSLTokenCode_id_repeat,
	BSLTokenCode_id_return,
	BSLTokenCode_id_string,
	BSLTokenCode_id_every,
	BSLTokenCode_id_false,
	BSLTokenCode_id_float,
	BSLTokenCode_id_using,
	BSLTokenCode_id_sleep,
	BSLTokenCode_id_bool,
	BSLTokenCode_id_else,
	BSLTokenCode_id_fork,
	BSLTokenCode_id_func,
	BSLTokenCode_id_over,
	BSLTokenCode_id_true,
	BSLTokenCode_id_void,
	BSLTokenCode_id_for,
	BSLTokenCode_id_int,
	BSLTokenCode_id_var,
	BSLTokenCode_id_at,
	BSLTokenCode_id_if,
	
	BSLTokenCode_id_generic,
	
	BSLTokenCode_id_EOF,
	BSLTokenCode_id_newline,
	BSLTokenCode_id_comment,
	
	BSLTokenCode_Count
} bsl_token_code;

#pragma mark bsl_error

typedef enum bsl_error {
	bsl_error_none,
	
	bsl_error_token_invalid_string, // invalid string syntax
	bsl_error_token_invalid_syntax, // syntax parsing error
	
	bsl_error_var_invalid_type_id, // invalid var type
	bsl_error_var_invalid_type_assignment, // mismatch of data to var type
	
	bsl_error_reserved_word, // use of a reserved keyword
	
	bsl_error_invalid_identifier, // unknown identifier
	bsl_error_invalid_scope, // scope is not valid for current evaluation
	bsl_error_invalid_parameter_type, // parameter type mismatch
	bsl_error_invalid_conditional, // conditional type error
	
	bsl_error_registered_symbol, // symbol is already registered, duplicate
	
	bsl_error_func_param_count, // parameter count is greater than 8
	
	bsl_error_count
} bsl_error;

#pragma mark bsl_token

struct bsl_token {
	bsl_token_code code;
	bsl_script_offset offset;
	char *contents; // not allocated, this points directly to the context's text, use offset
	bsl_error error;
} __attribute__((packed));

#pragma mark bsl_tkn_ir

struct bsl_tkn_ir {
	bsl_token *token;
	
	bsl_tkn_ir *next;
	bsl_tkn_ir *prev;
};

#pragma mark -
#pragma mark BSLExpression

#pragma mark bsl_scope_type

typedef enum bsl_scope_type {
	BSLScope_invalid,
	
	BSLScope_global,
	BSLScope_func,
	BSLScope_cond,
	
	BSLScope_Count
} bsl_scope_type;

#pragma mark bsl_expression

struct bsl_expression {
	bsl_scope_type scope_type;
	int8_t scope_level;
	bsl_tkn_ir *tokens;
} __attribute__((packed));

#pragma mark -
#pragma mark BSLVariable

#pragma mark bsl_variable_type

typedef enum bsl_variable_type {
	bsl_variable_None,
	
	bsl_variable_int,
	bsl_variable_bool,
	bsl_variable_string,
	bsl_variable_float,
	bsl_variable_void,
	
	bsl_variable_Count
} bsl_variable_type;

#pragma mark bsl_variable

struct bsl_variable {
	bsl_variable_type type;
	char *name;
	
	union bsl_variable_union {
		float f;
		int i;
		int8_t b;
		char *s;
	} u;
};

#pragma mark -
#pragma mark BSLFunction

#pragma mark bsl_func_arg

struct bsl_func_arg {
	bsl_variable *args;
	uint8_t arg_type_count;
	
};

#pragma mark bsl_func_rtype

typedef enum bsl_func_rtype {
	bsl_func_rtype_invalid,
	
	bsl_func_rtype_bool,
	bsl_func_rtype_int,
	bsl_func_rtype_void,
	bsl_func_rtype_float,
	bsl_func_rtype_string,
	
	bsl_func_rtype_Count
} bsl_func_rtype;

#pragma mark bsl_func_type

typedef enum bsl_func_type {
	bsl_func_type_invalid,
	
	bsl_func_type_interp,
	bsl_func_type_comp,
	
	bsl_func_type_Count
} bsl_func_type;

#pragma mark Pointer Types

typedef uintptr_t* Pointer;
typedef bsl_variable * (*FunctionPointer)(bsl_context **context, bsl_symbol *symbol, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count);
typedef uint8_t (*FPCallback)(void *context, struct time_interval interval);

#pragma mark bsl_interpreted_code

struct bsl_interpreted_code {
	bsl_expression *expression;
	uint32_t expression_count;
};

#pragma mark bsl_function_interpreted

struct bsl_function_interpreted {
	bsl_interpreted_code code;
};

#pragma mark bsl_function_compiled

struct bsl_function_compiled {
	FunctionPointer parse;
	FunctionPointer call;
};

#pragma mark bsl_function

struct bsl_function {
	bsl_func_type type;
	
	char *name;
	bsl_func_rtype rtype;
	
	bsl_func_arg *args;
	uint32_t arg_count;
	
	union bsl_function_union {
		bsl_function_interpreted interp;
		bsl_function_compiled comp;
	} u;
};

#pragma mark -
#pragma mark BSLDatabase

#pragma mark bsl_database

struct bsl_database {
	cmap_str symtab;
};

#pragma mark bsl_db_register_type

typedef enum bsl_db_register_type {
	bsl_db_register_type_invalid,
	
	bsl_db_register_type_void,
	bsl_db_register_type_int,
	bsl_db_register_type_float,
	bsl_db_register_type_bool,
	bsl_db_register_type_string,
	
	bsl_db_register_type_count
} bsl_db_register_type;

#pragma mark bsl_register_func_item

struct bsl_register_func_item {
	char *name;
	bsl_db_register_type rtype;
	char *args;
	
	FunctionPointer parse;
	FunctionPointer call;
};

#pragma mark bsl_register_var_item

struct bsl_register_var_item {
	char *name;
	bsl_db_register_type type;
};

#pragma mark -
#pragma mark BSLStatement

#pragma mark bsl_statement_type

typedef enum bsl_statement_type {
	bsl_statement_type_invalid,
	
	bsl_statement_type_conditional,
	bsl_statement_type_sleep,
	bsl_statement_type_fork,
	bsl_statement_type_schedule,
	bsl_statement_type_iterate,
	bsl_statement_type_return,
	bsl_statement_type_func,
	bsl_statement_type_var,
	
	bsl_statement_type_count
} bsl_statement_type;

#pragma mark bsl_statement_func

struct bsl_statement_func {
	bsl_function function;
};

#pragma mark bsl_statement_var

struct bsl_statement_var {
	bsl_stack_scope *scope;
	bsl_variable variable;
};

#pragma mark bsl_statement_fork

struct bsl_statement_fork {
	bsl_statement_func function;
};

#pragma mark bsl_statement_sleep

struct bsl_statement_sleep {
	struct timeval total;
	struct timeval current;
};

#pragma mark bsl_statement_schedule

struct bsl_statement_schedule {
	bsl_statement_sleep sleep;
	bsl_statement_fork fork;
};

#pragma mark bsl_conditional_type

typedef enum bsl_conditional_type {
	bsl_conditional_type_invalid,
	
	bsl_conditional_type_if,
	bsl_conditional_type_else,
	
	bsl_conditional_type_count
} bsl_conditional_type;

#pragma mark bsl_conditional

struct bsl_conditional {
	bsl_conditional_type type;
	
	bsl_operation *op;
	uint8_t op_count;
};

#pragma mark bsl_statement_conditional_case

struct bsl_statement_conditional_case {
	bsl_conditional *cond;
	
	bsl_interpreted_code code;
};

#pragma mark bsl_statement_conditional

struct bsl_statement_conditional {
	bsl_statement_conditional_case *cond_case;
	uint8_t case_count;
};

#pragma mark bsl_statement_return

struct bsl_statement_return {
	bsl_variable *variable;
};

#pragma mark bsl_statement_iterate

struct bsl_statement_iterate {
	
};

#pragma mark bsl_statement

struct bsl_statement {
	bsl_statement_type type;
	
	union bsl_statement_union {
		bsl_statement_schedule schedule;
		bsl_statement_conditional conditional;
		bsl_statement_fork fork;
		bsl_statement_sleep sleep;
		bsl_statement_return ret;
		bsl_statement_iterate iterate;
		bsl_statement_func func;
		bsl_statement_var var;
	} u;
};

#pragma mark -
#pragma mark BSLOperation

#pragma mark bsl_operation_action

typedef enum bsl_operation_action {
	bsl_operation_action_invalid,
	
	bsl_operation_action_cmp_lt,
	bsl_operation_action_cmp_le,
	bsl_operation_action_cmp_eq,
	bsl_operation_action_cmp_ne,
	bsl_operation_action_cmp_ge,
	bsl_operation_action_cmp_gt,
	
	bsl_operation_action_act_and,
	bsl_operation_action_act_or,
	bsl_operation_action_act_not,
	
	bsl_operation_action_count
} bsl_operation_action;

#pragma mark bsl_operation

struct bsl_operation {
	bsl_statement statement_r;
	
	// action
	bsl_operation_action action;
	
	bsl_statement statement_l;
};

#pragma mark -
#pragma mark BSLSymbol

#pragma mark bsl_symbol_type

typedef enum bsl_symbol_type {
	bsl_symbol_type_invalid,
	
	bsl_symbol_type_variable,
	bsl_symbol_type_function,
	bsl_symbol_type_statement,
	
	bsl_symbol_type_Count
} bsl_symbol_type;

#pragma mark bsl_symbol

struct bsl_symbol {
	bsl_symbol_type type;
	
	bsl_script *script;
	uint32_t line;
	uint32_t index;
	
	union bsl_symbol_union {
		bsl_variable value;
		bsl_function func;
		bsl_statement expr;
	} u;
	
	
};

#pragma mark -
#pragma mark BSLStack

#pragma mark bsl_stack_scope

struct bsl_stack_scope {
	bsl_scope_type scope_level;
	int8_t scope_depth;
	
	cmap_str symtab;
	
	bsl_symbol *symbol;
	
	bsl_stack_scope *next;
	bsl_stack_scope *prev;
};

#pragma mark bsl_stack

struct bsl_stack {
	
	bsl_stack_scope *active;
	
	bsl_stack_scope *state;
};

#pragma mark -
#pragma mark BSLContext

#pragma mark bsl_context

struct bsl_context {
	bsl_scope_type curr_scope;
	int8_t scope_depth;
	
	bsl_database *global;
	
	bsl_stack *stack;
	
	bsl_error error;
	uint8_t active_err;
};

#pragma mark -
#pragma mark BSLScheduleItem

#pragma mark bsl_schedule_item

struct bsl_schedule_item {
	uint32_t item_count;
	
	bsl_schedule_item *items;
	
	// something to evaluate
	bsl_statement *statement;
	
	bsl_schedule_item *parent;
};

#pragma mark -
#pragma mark BSLScheduler

#pragma mark bsl_scheduler

struct bsl_scheduler {
	uint32_t current_tick;
	
	uint32_t stack_depth;
	
	bsl_schedule_item *stack;
	
	bsl_schedule_item *current;
};

#endif
