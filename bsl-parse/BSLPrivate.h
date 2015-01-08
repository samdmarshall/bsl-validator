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
#include <ctype.h>
#include <unistd.h>

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


#if DEBUG
#define debug_printf(fmt, ...) printf(fmt, __VA_ARGS__)
#else
#define debug_printf(fmt, ...)
#endif

#pragma mark -
#pragma mark BSLScript

struct bsl_script {
	file_ref *fd;
	mem_buff *contents;
};

struct bsl_script_offset {
	bsl_script *script;
	uint32_t line;
	uint32_t index;
	int16_t length;
} __attribute__((packed));

#pragma mark -
#pragma mark BSLToken

typedef enum {
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

typedef enum {
	bsl_error_none,
	
	bsl_error_token_invalid_string,
	bsl_error_token_invalid_syntax,
	
	bsl_error_var_invalid_type_id,
	bsl_error_var_invalid_type_assignment,
	
	bsl_error_invalid_identifier,
	bsl_error_reserved_word,
	bsl_error_invalid_scope,
	
	bsl_error_registered_symbol,
	
	bsl_error_count
} bsl_error;

struct bsl_token {
	bsl_token_code code;
	bsl_script_offset offset;
	char *contents; // not allocated, this points directly to the context's text, use offset
	bsl_error error;
} __attribute__((packed));

#pragma mark -
#pragma mark BSLParse

struct bsl_tkn_ir {
	bsl_token *token;
	
	bsl_tkn_ir *next;
	bsl_tkn_ir *prev;
};

#pragma mark -
#pragma mark BSLExpression

typedef enum {
	BSLScope_invalid,
	
	BSLScope_global,
	BSLScope_func,
	BSLScope_cond,
	
	BSLScope_Count
} bsl_scope_type;

struct bsl_expression {
	bsl_scope_type scope_type;
	int8_t scope_level;
	bsl_tkn_ir *tokens;
} __attribute__((packed));

#pragma mark -
#pragma mark BSLDatabase

struct bsl_database {
	cmap_str symtab;
};

#pragma mark -
#pragma mark BSLVariable

typedef enum {
	bsl_variable_None,
	
	bsl_variable_int,
	bsl_variable_bool,
	bsl_variable_string,
	bsl_variable_float,
	
	bsl_variable_Count
} bsl_variable_type;

struct bsl_variable {
	bsl_variable_type type;
	char *name;
	
	union {
		float f;
		int i;
		int8_t b;
		char *s;
	} u;
};

#pragma mark -
#pragma mark BSLFunction

struct bsl_func_arg {
	bsl_variable *args;
	uint8_t arg_type_count;
	
};

typedef enum {
	bsl_func_rtype_invalid,
	
	bsl_func_rtype_bool,
	bsl_func_rtype_int,
	bsl_func_rtype_void,
	bsl_func_rtype_float,
	bsl_func_rtype_string,
	
	bsl_func_rtype_Count
} bsl_func_rtype;

typedef enum {
	bsl_func_type_invalid,
	
	bsl_func_type_interp,
	bsl_func_type_comp,
	
	bsl_func_type_Count
} bsl_func_type;

typedef uintptr_t* Pointer;
typedef uintptr_t* (*FunctionPointer)(bsl_context **context, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count);
typedef uint8_t (*FPCallback)(void *context);

struct bsl_function_interpreted {
	bsl_expression *expression;
	uint32_t expression_count;
};

struct bsl_function_compiled {
	FunctionPointer parse;
	FunctionPointer call;
};

struct bsl_function {
	bsl_func_type type;
	
	char *name;
	bsl_func_rtype rtype;
	
	bsl_func_arg *args;
	uint32_t arg_count;
	
	union {
		bsl_function_interpreted interp;
		bsl_function_compiled comp;
	} u;
};

#pragma mark -
#pragma mark BSL Register Item


typedef enum {
	bsl_db_register_type_invalid,
	
	bsl_db_register_type_void,
	bsl_db_register_type_int,
	bsl_db_register_type_float,
	bsl_db_register_type_bool,
	bsl_db_register_type_string,
	
	bsl_db_register_type_count
} bsl_db_register_type;

struct bsl_register_func_item {
	char *name;
	bsl_db_register_type rtype;
	char *args;
	
	FunctionPointer parse;
	FunctionPointer call;
};

struct bsl_register_var_item {
	char *name;
	bsl_db_register_type type;
};

#pragma mark -
#pragma mark BSLStatement

typedef enum {
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

struct bsl_statement {
	bsl_statement_type type;
	
	union {
		
	} u;
};

#pragma mark -
#pragma mark BSLSymbol

typedef enum {
	bsl_symbol_type_invalid,
	
	bsl_symbol_type_variable,
	bsl_symbol_type_function,
	bsl_symbol_type_statement,
	
	bsl_symbol_type_Count
} bsl_symbol_type;

struct bsl_symbol {
	bsl_symbol_type type;
	
	bsl_script *script;
	uint32_t line;
	uint32_t index;
	
	union {
		bsl_variable value;
		bsl_function func;
		bsl_statement expr;
	} u;
	
	
};

#pragma mark -
#pragma mark BSLStack

struct bsl_stack_scope {
	bsl_scope_type scope_level;
	int8_t scope_depth;
	
	cmap_str symtab;
	
	bsl_symbol *symbol;
	
	bsl_stack_scope *next;
	bsl_stack_scope *prev;
};

struct bsl_stack {
	
	bsl_stack_scope *active;
	
	bsl_stack_scope *state;
};

#pragma mark -
#pragma mark BSLContext

struct bsl_context {
	bsl_scope_type curr_scope;
	int8_t scope_depth;
	
	bsl_database *global;
	
	bsl_stack *stack;
	
	bsl_error error;
};

#pragma mark -
#pragma mark BSLScheduleItem

struct bsl_schedule_item {
	uint32_t item_count;
	
	bsl_schedule_item *items;

	// something to evaluate
};

#pragma mark -
#pragma mark BSLScheduler

struct bsl_scheduler {
	uint32_t stack_depth;
	
	uint32_t current_tick;
	
	bsl_schedule_item *stack;
	
	bsl_schedule_item *current;
};

#endif
