//
//  BSLToken.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLToken.h"
#include "BSLTokenDefinitions.h"

// This is used to take raw text and generate a token from it
bsl_token * read_token(mem_buff *text) {
	// make sure that we don't over-run the text buffer, return NULL to signal it to stop
	if (text->offset < text->length) {
		
		// allocating the token
		bsl_token *token = calloc(1, sizeof(bsl_token));
		
		// ensure that allocation was successful
		if (token != NULL) {
			
			// no errors in parsing so far
			token->error = bsl_error_none;
			
			// placeholder for the initial position of the loop
			char *initial = NULL;
			
			// this is a goto loop due to the unique nature of whitespace
loop_parse:
			{
				// assume that the token starts at current offset in the text buffer
				token->contents = &(text->data[text->offset]);
				
				// save pointer to intial text position
				initial = token->contents;
				
				// current text pointer, this is used for tracking
				char *curr_ptr = token->contents;
				// current char value of the current text pointer
				char curr = curr_ptr[0];
				// current char value of the next char following current
				char peek = text->data[text->offset + 1 ];
				
				// index offset in the text buffer of the token start position
				token->offset.index = text->offset;
				
				if (curr == 0) { // checking if the current text char is end of string, this is the end of the text buffer
					// EOF token
					token->code = BSLTokenCode_id_EOF;
				}
				else if (curr == '\r') { // checking if current text char is a windows newline character
					// found a windows new line
					
					// increase text pointer offset by one '\r'
					text->offset++;
					// increase the token length
					token->offset.length++;
					// checking if the next char is a unix newline
					if (peek == '\n') {
						// found a unix newline
						
						// increasing the text pointer offset by one '\n'
						text->offset++;
						// increasing the token length by one
						token->offset.length++;
					}
					// token is a newline
					token->code = BSLTokenCode_id_newline;
				}
				else if (curr == '\n') { // checking if current text char is a unix newline character
					// found a unix new line
					
					// increasing text pointer offset by one '\n'
					text->offset++;
					// increasing the token length by one '\n'
					token->offset.length++;
					// checking if the next char is a windows newline
					if (peek == '\r') {
						// found a windows new line
						
						// increasing the text pointer offset by one '\r'
						text->offset++;
						// increasing the token length by one
						token->offset.length++;
					}
					// token is a newline
					token->code = BSLTokenCode_id_newline;
				}
				else if (isspace(curr)) { // BSL doesn't care about whitespace or indentation, so this exists to skip whitespace between tokens
					// found whitespace character
					
					// while the current text pointer is whitespace and not a newline or an EOF...
					while(isspace(curr) && curr != '\n' && curr != '\r' && curr != 0) {
						// increase the text pointer offset by one
						text->offset++;
						// reassign the current text char value
						curr = text->data[text->offset];
					}
					// once the current char value is not whitespace, jump back to the beginning of the loop to process the token
					goto loop_parse;
				}
				else if (((initial[0] == 'f' || initial[0] == '-') && isdigit(initial[1])) || (isdigit(curr) || curr == '.')) { // check if number token
					// number tokens are of type "int", "float", "bool"
					/*
					 int:
						f10
						86f
						6
						-5
						
					 float:
						f10.0
						16.f
						-4.3f
					 
					 bool:
						1
						0
					*/
					
					// default token length is 1
					token->offset.length = 1;
					// default token number type is "int"
					token->code = BSLTokenCode_id_int;
					// increase offset in text
					text->offset++;
					
					// getting the next char value
					char curr_tmp = text->data[text->offset];
					
					// the first character of a number token can be '-', the rest of it has to be comprised of only digits, '.' and 'f'
					while (isdigit(curr_tmp) || curr_tmp == '.' || curr_tmp == 'f') {
						// increase the token length because the current value passes
						token->offset.length++;
						// increase the offset in the text
						text->offset++;
						// reassign the next value from the text buffer to check
						curr_tmp = text->data[text->offset];
					}
					
					// check if the token is only one digit, this is either a single digit number or a boolean
					if (token->offset.length == 1) {
						// checking for booleans
						
						// check of the token is '1' -- signifying "true"
						if (strcmp(token->contents, "1") == 0) {
							// token is a boolean "true"
							token->code = BSLTokenCode_id_true;
						}
						
						// check of the token is '0' -- signifying "false"
						if (strcmp(token->contents, "0") == 0) {
							// token is a boolean "false"
							token->code = BSLTokenCode_id_false;
						}
						
						// token remains the default "int" type
					}
					else { // token is more than one char in length, it is either an "int" or "float"
						// find if int or float
						if (strnstr(token->contents, ".", sizeof(char[token->offset.length])) != NULL) {
							// if the token contains the character "." then it is considered a float type
							token->code = BSLTokenCode_id_float;
						}
						
						// token remains the default "int" type
					}
				}
				else if (isalpha(curr) || curr == '_') { // tokens starting with alphabetic values or an underscore are considered generic identifiers
					// looking for identifiers
					
					// default token length is 1
					token->offset.length = 1;
					// default token type is generic
					token->code = BSLTokenCode_id_generic;
					// increasing the offset in the text buffer
					text->offset++;
					// getting the next value in the text buffer
					char curr_tmp = text->data[text->offset];
					// identifiers can contain (anything past the first character) alphanumeric values and underscores
					while (isalnum(curr_tmp) || curr_tmp == '_') {
						// if the current text char value passes, increase the token length
						token->offset.length++;
						// increase the text offset
						text->offset++;
						// reassign the current char value based on increase in text buffer
						curr_tmp = text->data[text->offset];
					}
					
					// see if reserved word
					token->code = bsl_token_resolve_identifier(token);
				}
				else { // fall-through logic of the original implementation to other types of tokens
					
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