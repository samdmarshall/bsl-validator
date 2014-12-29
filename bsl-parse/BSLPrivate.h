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

#pragma mark -
#pragma mark BSLScript

typedef struct bsl_script bsl_script;

struct bsl_script {
	file_ref *fd;
	mem_buff *contents;
};

typedef struct bsl_script_offset bsl_script_offset;

struct bsl_script_offset {
	bsl_script *script;
	uint16_t line;
	uint16_t index;
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
	
	bsl_error_invalid_identifier,
	bsl_error_reserved_word,
	
	bsl_error_count
} bsl_error;

typedef struct bsl_token bsl_token;

struct bsl_token {
	uint16_t code;
	bsl_script_offset offset;
	char *contents; // not allocated, this points directly to the context's text, use offset
	bsl_error error;
} __attribute__((packed));

#pragma mark -
#pragma mark BSLParse

typedef struct bsl_tkn_ir bsl_tkn_ir;

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

typedef struct bsl_expression bsl_expression;

struct bsl_expression {
	bsl_scope_type scope_type;
	int8_t scope_level;
	bsl_tkn_ir *tokens;
} __attribute__((packed));

#pragma mark -
#pragma mark BSLDatabase

typedef struct bsl_database bsl_database;

struct bsl_database {
	cmap_str symtab;
};

#pragma mark -
#pragma mark BSLStack

typedef struct bsl_stack_scope bsl_stack_scope;

struct bsl_stack_scope {
	bsl_scope_type scope_level;
	int8_t scope_depth;
	
	cmap_str symtab;
	
	bsl_stack_scope *next;
	bsl_stack_scope *prev;
};

typedef struct bsl_stack bsl_stack;

struct bsl_stack {
	
	bsl_stack_scope *active;
	
	bsl_stack_scope *state;
};

#pragma mark -
#pragma mark BSLContext

typedef struct bsl_context bsl_context;

struct bsl_context {
	bsl_scope_type curr_scope;
	int8_t scope_depth;
	
	bsl_database *global;
	
	bsl_stack *stack;
	
	bsl_error error;
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

typedef struct bsl_variable bsl_variable;

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

typedef struct bsl_func_arg bsl_func_arg;

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

typedef struct bsl_function_interpreted bsl_function_interpreted;

struct bsl_function_interpreted {
	bsl_expression *expression;
	uint32_t expression_count;
};

typedef uintptr_t* Pointer;
typedef uintptr_t* (*FunctionPointer)(bsl_context **context, bsl_func_rtype rtype, bsl_func_arg *args, uint32_t arg_count);

typedef struct bsl_function_compiled bsl_function_compiled;

struct bsl_function_compiled {
	FunctionPointer call;
};

typedef struct bsl_function bsl_function;

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
#pragma mark BSLSymbol

typedef enum {
	bsl_symbol_type_invalid,
	
	bsl_symbol_type_variable,
	bsl_symbol_type_function,
	
	bsl_symbol_type_Count
} bsl_symbol_type;

typedef struct bsl_symbol bsl_symbol;

struct bsl_symbol {
	bsl_symbol_type type;
	
	bsl_script *script;
	uint16_t line;
	
	union {
		bsl_variable value;
		bsl_function func;
	} u;
	
	
};

#endif
