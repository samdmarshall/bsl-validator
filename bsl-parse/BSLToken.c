//
//  BSLToken.c
//  bsl-parse
//
//  Created by Samantha Marshall on 12/27/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#include "BSLToken.h"
#include "BSLTokenDefinitions.h"
#include "BSLContext.h"

// This is used to take raw text and generate a token from it
bsl_token *bsl_read_token(mem_buff *text)
{
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

		// clang-format off
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
				char peek = (text->offset + 1 >= text->length ? '\0' : text->data[text->offset + 1 ]);
				
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
						case '!': { // logical NOT operator
							// token length of one
							token->offset.length = 1;
							// token code for logical NOT
							token->code = BSLTokenCode_op_NOT;
							// increase to next position in text buffer
							text->offset++;
							
							break;
						}
						case '\"': { // start of string
							// default token length is one
							token->offset.length = 1;
							// token code string identifier type
							token->code = BSLTokenCode_id_string;
							// advance to next position in text buffer
							text->offset++;
							
							// finding the whole string value
							while (1) { // while true
								// getting current text char value
								char curr_tmp = text->data[text->offset];
								
								// finding if the current char value is the end of a string
								if (curr_tmp == '\"' || curr_tmp == '"') {
									// found the end of the string identifier, increase length to include this identifier
									token->offset.length++;
									// increase to the next position in the text buffer
									text->offset++;
									// leave the while loop
									break;
								}
								
								// finding if the current char value is a syntax error
								if (curr_tmp == 0 || curr_tmp == '\n' || curr_tmp == '\r') {
									// this is a syntax error
									token->error = bsl_error_token_invalid_string; // ERROR ASSIGNMENT
									// leave the while loop
									break;
								}
								
								// increase token length
								token->offset.length++;
								// advance to the next position in the text buffer
								text->offset++;
							}
							
							break;
						}
						case '(': { // left parenthesis
							// default token length of one
							token->offset.length = 1;
							// token left parenthesis code
							token->code = BSLTokenCode_ctl_lparen;
							// increase offset in text
							text->offset++;
							break;
						}
						case ')': { // right parenthesis
							// default token length of one
							token->offset.length = 1;
							// token right parenthesis code
							token->code = BSLTokenCode_ctl_rparen;
							// increase offset in text
							text->offset++;
							break;
						}
						case '[': { // left square bracket
							// default token length of one
							token->offset.length = 1;
							// token left square bracket code
							token->code = BSLTokenCode_ctl_lbracket;
							// increase offset in text
							text->offset++;
							break;
						}
						case ']': { // right square bracket
							// default token length of one
							token->offset.length = 1;
							// token right square bracket code
							token->code = BSLTokenCode_ctl_rbracket;
							// increase offset in text
							text->offset++;
							break;
						}
						case '+': { // addition operator
							// default token length of one
							token->offset.length = 1;
							// token addition operator code
							token->code = BSLTokenCode_op_plus;
							// increase offset in text
							text->offset++;
							break;
						}
						case '-': { // subtraction operator
							// default token length of one
							token->offset.length = 1;
							// token subtraction operator code
							token->code = BSLTokenCode_op_minus;
							// increase offset in text
							text->offset++;
							break;
						}
						case ',': { // comma
							// default token length of one
							token->offset.length = 1;
							token->code = BSLTokenCode_ctl_comma;
							// increase offset in text
							text->offset++;
							break;
						}
						case ';': { // semicolon
							// default token length of one
							token->offset.length = 1;
							// token semicolon operator code
							token->code = BSLTokenCode_ctl_semicolon;
							// increase offset in text
							text->offset++;
							break;
						}
						case ':': { // colon
							// default token length of one
							token->offset.length = 1;
							// token colon operator code
							token->code = BSLTokenCode_ctl_colon;
							// increase offset in text
							text->offset++;
							break;
						}
						case '=': { // assignment operator
							// default token length of one
							token->offset.length = 1;
							// token assignment operator code
							token->code = BSLTokenCode_op_assign;
							// increase offset in text
							text->offset++;
							break;
						}
						case '{': { // left brace
							// default token length of one
							token->offset.length = 1;
							// token left brace code
							token->code = BSLTokenCode_ctl_lbrace;
							// increase offset in text
							text->offset++;
							break;
						}
						case '}': { // right brace
							// default token length of one
							token->offset.length = 1;
							// token right brace code
							token->code = BSLTokenCode_ctl_rbrace;
							// increase offset in text
							text->offset++;
							break;
						}
						case '|': { // vertical bar
							// default token length of one
							token->offset.length = 1;
							// token vertical bar code
							token->code = BSLTokenCode_bar;
							// increase offset in text
							text->offset++;
							break;
						}
						case '<': { // less than operator
							// default token length of one
							token->offset.length = 1;
							// token less than code
							token->code = BSLTokenCode_cmp_lt;
							// increase offset in text
							text->offset++;
							
							if (peek == '=') {
								// increate the token length
								token->offset.length++;
								// token less than or equal to code
								token->code = BSLTokenCode_cmp_le;
								// increase offset in text
								text->offset++;
							}
							
							break;
						}
						case '>': { // greater than operator
							// default token length of one
							token->offset.length = 1;
							// token greater than code
							token->code = BSLTokenCode_cmp_gt;
							// increase offset in text
							text->offset++;
							
							if (peek == '=') {
								// increate the token length
								token->offset.length++;
								// token greater than or equal to code
								token->code = BSLTokenCode_cmp_ge;
								// increase offset in text
								text->offset++;
							}
							
							break;
						}
						case '#': { // comment token
							// default token length is at least one
							token->offset.length = 1;
							// token comment code
							token->code = BSLTokenCode_id_comment;
							// increase offset in text
							text->offset++;
							
							// finding the end of the current line
							while (1) { // while true
								// getting the current char value from the text buffer
								char curr_tmp = text->data[text->offset];
								// getting the next char value from the text buffer
								char peek_tmp = text->data[text->offset + 1 ];
								
								if(curr_tmp == 0) { // if this is the end of the memory buffer
									// leave the while loop
									break;
								}
								if(curr_tmp == '\n') {
									// increase offset in text
									text->offset++;
									// increate the length of the token
									token->offset.length += 1;
									
									if(peek_tmp == '\r') {
										// increase offset in text
										text->offset++;
										// increate the length of the token
										token->offset.length += 1;
									}
									// leave the while loop because we have found the end of the line
									break;
								}
								
								if (curr_tmp == '\r') {
									// increase offset in text
									text->offset++;
									// increate the length of the token
									token->offset.length += 1;
									
									if (peek_tmp == '\n') {
										// increase offset in text
										text->offset++;
										// increate the length of the token
										token->offset.length += 1;
									}
									// leave the while loop because we have found the end of the line
									break;
								}
								
								token->offset.length++;
								// increase offset in text
								text->offset++;
							}
							
							break;
						}
						default: { // other syntax
							// syntax error
							token->error = bsl_error_token_invalid_syntax; // ERROR ASSIGNMENT
							break;
						}
					}
				}
			}
			// clang-format on
		}

		return token;
	}
	else {
		return NULL;
	}
}

void bsl_token_check_scope_increase(bsl_context *context, int8_t *scope, bsl_token *token, bsl_token_code code)
{
	if (token->code == code) {
		(*scope) += 1;
	}

	switch (code) {
		case BSLTokenCode_ctl_lparen: {
			if ((*scope) > 4) {
				// expression too complex
				bsl_context_assign_error(context, bsl_error_invalid_scope); // ERROR ASSIGNMENT
			}
			break;
		}
		case BSLTokenCode_ctl_lbrace: {
			break;
		}
		case BSLTokenCode_ctl_lbracket: {
			break;
		}
		default: {
			break;
		}
	}
}

void bsl_token_check_scope_decrease(bsl_context *context, int8_t *scope, bsl_token *token, bsl_token_code code)
{
	if (token->code == code) {
		(*scope) -= 1;
	}

	if ((*scope) < 0) {
		// error
		bsl_context_assign_error(context, bsl_error_invalid_scope); // ERROR ASSIGNMENT
	}
}

int bsl_token_check_error(bsl_token *token)
{
	char message[1024] = {0};
	switch (token->error) {
		case bsl_error_none: {
			break;
		}
		case bsl_error_token_invalid_string: {
			sprintf(message, "Invalid string constant at %s:%i", token->offset.script->fd->name, token->offset.line);
			break;
		}
		case bsl_error_token_invalid_syntax: {
			sprintf(message, "Invalid Syntax at %s:%i", token->offset.script->fd->name, token->offset.line);
			break;
		}
		case bsl_error_invalid_scope: {
			sprintf(message, "Scoping error at %s:%i", token->offset.script->fd->name, token->offset.line);
			break;
		}
		default: {
			sprintf(message, "Unknown Error Code <%i>", token->error);
			break;
		}
	}
	if (message[0] != 0) {
		printf("%s\n", message);
	}

	return token->error;
}