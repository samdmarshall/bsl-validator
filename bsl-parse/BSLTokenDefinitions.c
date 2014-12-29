//
//  BSLTokenLookup.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLTokenDefinitions.h"

#define str(v) #v
#define csize(v) sizeof(str(v))-1

#define token_len(v, code) \
case v: { \
	switch (token->contents[0]) { \
		code \
		default: { \
			return BSLTokenCode_id_generic; \
		} \
	} \
}

#define key(v, code) \
case v: { \
	code \
}

#define word(ident,flag) \
if (strncmp(token->contents, str(ident), csize(ident)) == 0) { \
	return flag; \
}

bsl_token_code bsl_token_resolve_identifier(bsl_token *token) {
	if (token->offset.length > 8 || token->offset.length < 2) {
		return BSLTokenCode_id_generic;
	}
	else {
		// NOTE: The following must be in alphabetical ordering
		//		to add more keywords, use the macros provided.
		switch (token->offset.length) {
			token_len(2, {
				key('a', {
					word(at, BSLTokenCode_id_at)
				})
				key('e', {
					word(eq, BSLTokenCode_cmp_eq)
				})
				key('i', {
					word(if, BSLTokenCode_id_if)
				})
				key('n', {
					word(ne, BSLTokenCode_cmp_ne)
				})
				key('o', {
					word(or, BSLTokenCode_op_OR)
				})
			})
			token_len(3, {
				key('a', {
					word(and, BSLTokenCode_op_AND)
				})
				key('f', {
					word(for, BSLTokenCode_id_for)
				})
				key('i', {
					word(int, BSLTokenCode_type_int)
				})
				key('v', {
					word(var, BSLTokenCode_id_var)
				})
			})
			token_len(4, {
				key('b', {
					word(bool, BSLTokenCode_type_bool)
				})
				key('e', {
					word(else, BSLTokenCode_id_else)
				})
				key('f', {
					word(func, BSLTokenCode_id_func)
					word(fork, BSLTokenCode_id_fork)
				})
				key('o', {
					word(over, BSLTokenCode_id_over)
				})
				key('t', {
					word(true, BSLTokenCode_id_true)
				})
				key('v', {
					word(void, BSLTokenCode_id_void)
				})
			})
			token_len(5, {
				key('e', {
					word(every, BSLTokenCode_id_every)
				})
				key('f', {
					word(false, BSLTokenCode_id_false)
					word(float, BSLTokenCode_id_float)
				})
				key('s', {
					word(sleep, BSLTokenCode_id_sleep)
				})
				key('u', {
					word(using, BSLTokenCode_id_using)
				})
			})
			token_len(6, {
				key('r', {
					word(repeat, BSLTokenCode_id_repeat)
					word(return, BSLTokenCode_id_return)
				})
				key('s', {
					word(string, BSLTokenCode_id_string)
				})
			})
			token_len(7, {
				key('i', {
					word(iterate, BSLTokenCode_id_iterate)
				})
			})
			token_len(8, {
				key('s', {
					word(schedule, BSLTokenCode_id_schedule)
				})
			})
			default: {
				return BSLTokenCode_id_generic;
			}
		}
	}
}
