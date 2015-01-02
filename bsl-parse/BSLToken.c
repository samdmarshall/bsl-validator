//
//  BSLToken.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLToken.h"
#include "BSLTokenDefinitions.h"

bsl_token * read_token(mem_buff *text) {
	if (text->offset < text->length) {
		
		bsl_token *token = calloc(1, sizeof(bsl_token));
		
		token->error = bsl_error_none;
		
		if (token != NULL) {
			
			char *initial = NULL;

loop_parse:
			{
				token->contents = &(text->data[text->offset]);
				
				initial = token->contents;
				
				char *curr_ptr = token->contents;
				char curr = curr_ptr[0];
				char peek = text->data[text->offset + 1 ];
				
				token->offset.index = text->offset;
				
				if (curr == 0) {
					// EOF
					token->code = BSLTokenCode_id_EOF;
				}
				else if (curr == '\r') {
					// new line
					text->offset++;
					token->offset.length++;
					if (peek == '\n') {
						text->offset++;
						token->offset.length++;
					}
					token->code = BSLTokenCode_id_newline;
				}
				else if (curr == '\n') {
					// new line
					text->offset++;
					token->offset.length++;
					if (peek == '\r') {
						text->offset++;
						token->offset.length++;
					}
					token->code = BSLTokenCode_id_newline;
				}
				else if (isspace(curr)) {
					// this is to skip whitespace
					while(isspace(curr) && curr != '\n' && curr != '\r' && curr != 0) {
						text->offset++;
						curr = text->data[text->offset];
					}
					goto loop_parse;
				}
				else if (((initial[0] == 'f' || initial[0] == '-') && isdigit(initial[1])) || (isdigit(curr) || curr == '.')) {
					// looking for values
					token->offset.length = 1;
					token->code = BSLTokenCode_id_int;
					text->offset++;
					
					char curr_tmp = text->data[text->offset];
					
					while (isdigit(curr_tmp) || curr_tmp == '.' || curr_tmp == 'f') {
						token->offset.length++;
						text->offset++;
						curr_tmp = text->data[text->offset];
					}
					
					if (token->offset.length == 1) {
						// checking for booleans
						if (strcmp(token->contents, "1") == 0) {
							token->code = BSLTokenCode_id_true;
						}
						if (strcmp(token->contents, "0") == 0) {
							token->code = BSLTokenCode_id_false;
						}
					}
					else {
						// find if int or float
						if (strnstr(token->contents, ".", sizeof(char[token->offset.length])) != NULL) {
							token->code = BSLTokenCode_id_float;
						}
					}
				}
				else if (isalpha(curr) || curr == '_') {
					// looking for identifiers
					token->offset.length = 1;
					token->code = BSLTokenCode_id_generic;
					text->offset++;
					
					char curr_tmp = text->data[text->offset];
					
					while (isalnum(curr_tmp) || curr_tmp == '_') {
						token->offset.length++;
						text->offset++;
						curr_tmp = text->data[text->offset];
					}
					
					// see if reserved word
					token->code = bsl_token_resolve_identifier(token);
				}
				else {
					// parsing the rest of the symbols
					switch (curr) {
						case '!': {
							token->offset.length = 1;
							token->code = BSLTokenCode_op_NOT;
							text->offset++;
							break;
						}
						case '\"': {
							token->offset.length = 1;
							token->code = BSLTokenCode_id_string;
							text->offset++;
							
							while (1) {
								char curr_tmp = text->data[text->offset];
								
								if (curr_tmp == '\"' || curr_tmp == '"') {
									token->offset.length++;
									text->offset++;
									break;
								}
								
								if (curr_tmp == 0 || curr_tmp == '\n' || curr_tmp == '\r') {
									// add check for syntax error
									token->error = bsl_error_token_invalid_string;
									break;
								}
								
								token->offset.length++;
								text->offset++;
							}
							break;
						}
						case '(': {
							token->offset.length = 1;
							token->code = BSLTokenCode_ctl_lparen;
							text->offset++;
							break;
						}
						case ')': {
							token->offset.length = 1;
							token->code = BSLTokenCode_ctl_rparen;
							text->offset++;
							break;
						}
						case '[': {
							token->offset.length = 1;
							token->code = BSLTokenCode_ctl_lbracket;
							text->offset++;
							break;
						}
						case ']': {
							token->offset.length = 1;
							token->code = BSLTokenCode_ctl_rbracket;
							text->offset++;
							break;
						}
						case '+': {
							token->offset.length = 1;
							token->code = BSLTokenCode_op_plus;
							text->offset++;
							break;
						}
						case '-': {
							token->offset.length = 1;
							token->code = BSLTokenCode_op_minus;
							text->offset++;
							break;
						}
						case ',': {
							token->offset.length = 1;
							token->code = BSLTokenCode_ctl_comma;
							text->offset++;
							break;
						}
						case ';': {
							token->offset.length = 1;
							token->code = BSLTokenCode_ctl_semicolon;
							text->offset++;
							break;
						}
						case ':': {
							token->offset.length = 1;
							token->code = BSLTokenCode_ctl_colon;
							text->offset++;
							break;
						}
						case '=': {
							token->offset.length = 1;
							token->code = BSLTokenCode_op_assign;
							text->offset++;
							break;
						}
						case '{': {
							token->offset.length = 1;
							token->code = BSLTokenCode_ctl_lbrace;
							text->offset++;
							break;
						}
						case '}': {
							token->offset.length = 1;
							token->code = BSLTokenCode_ctl_rbrace;
							text->offset++;
							break;
						}
						case '|': {
							token->offset.length = 1;
							token->code = BSLTokenCode_bar;
							text->offset++;
							break;
						}
						case '<': {
							token->offset.length = 1;
							token->code = BSLTokenCode_cmp_lt;
							text->offset++;
							if (peek == '=') {
								token->offset.length++;
								token->code = BSLTokenCode_cmp_le;
								text->offset++;
							}
							break;
						}
						case '>': {
							token->offset.length = 1;
							token->code = BSLTokenCode_cmp_gt;
							text->offset++;
							if (peek == '=') {
								token->offset.length++;
								token->code = BSLTokenCode_cmp_ge;
								text->offset++;
							}
							break;
						}
						case '#': {
							token->offset.length = 1;
							token->code = BSLTokenCode_id_comment;
							text->offset++;
							
							while (1) {
								char curr_tmp = text->data[text->offset];
								char peek_tmp = text->data[text->offset + 1 ];
								
								if(curr_tmp == 0) {
									break;
								}
								if(curr_tmp == '\n') {
									text->offset++;
									token->offset.length += 1;
									if(peek_tmp == '\r') {
										text->offset++;
										token->offset.length += 1;
									}
									break;
								}
								
								if (curr_tmp == '\r') {
									text->offset++;
									token->offset.length += 1;
									if (peek_tmp == '\n') {
										text->offset++;
										token->offset.length += 1;
									}
									break;
								}
								
								token->offset.length++;
								text->offset++;
							}
							
							break;
						}
						default: {
							// syntax error
							token->error = bsl_error_token_invalid_syntax;
							break;
						}
					}
				}
			}
		}
		
		return token;
	}
	else {
		return NULL;
	}
}

int check_token_error(bsl_token *token) {
	char message[1024] = {0};
	switch (token->error) {
		case bsl_error_none: {
			break;
		}
		case bsl_error_token_invalid_string: {
			sprintf(message, "Invalid string constant at %s:%i",token->offset.script->fd->name,token->offset.line);
			break;
		}
		case bsl_error_token_invalid_syntax: {
			sprintf(message, "Invalid Syntax at %s:%i",token->offset.script->fd->name,token->offset.line);
			break;
		}
		default: {
			sprintf(message, "Unknown Error Code <%i>",token->error);
			break;
		}
	}
	if (message[0] != 0) {
		printf("%s\n",message);
	}
	
	return token->error;
}