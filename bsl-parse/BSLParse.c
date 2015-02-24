//
//  BSLParse.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLParse.h"
#include "BSLToken.h"
#include "BSLExpression.h"

char *bsl_token_ir_copy_string(bsl_tkn_ir *token_ir)
{
	// the string need at least 1 byte length ('\0')
	uint32_t string_length = 1;
	// the index is base zero
	uint32_t string_index = 0;
	// assign the ir iterator to the start of the ir sequence
	bsl_tkn_ir *curr = token_ir;

	// this code is split into two while loops to simplify the logic

	while (curr != NULL) {		   // checks we haven't reached end of ir sequence
		if (curr->token != NULL) { // if the current ir item has a token value
			// add the length of the current ir token string plus the length of a space to the overall string length
			string_length += curr->token->offset.length + 1;
		}
		// advance to next ir item
		curr = curr->next;
	}

	// reset the ir iterator to the start of the ir sequence
	curr = token_ir;

	// allocate memory for string based on computed length
	char *string = calloc(string_length, sizeof(char));

	while (curr != NULL) {		   // checks we haven't reached the end of ir sequence
		if (curr->token != NULL) { // if the current ir item has a token value
			// copy the length of the current token string into the allocated string space
			strncpy(&(string[string_index]), curr->token->contents, sizeof(char[curr->token->offset.length]));

			// advance the offset in the allocated string
			string_index += curr->token->offset.length;
			// add the space between token strings
			string[string_index] = ' ';
			// advance the offset in the allocated string
			string_index++;
		}
		// advance to the next ir item
		curr = curr->next;
	}

	// decrement the space added at the lend of the last token string added
	string_index--;
	// assign null terminator to string instead of space
	string[string_index] = '\0';
	// return allocated string representation of the ir sequence
	return string;
}

bsl_tkn_ir *bsl_token_ir_generate_from_script(bsl_script *script)
{
	// allocating token ir sequence
	bsl_tkn_ir *token_ir = calloc(1, sizeof(bsl_tkn_ir));

	// setting up the tracking of previous and current ir items
	bsl_tkn_ir *prev = NULL;
	bsl_tkn_ir *curr = token_ir;

	// current string line counter
	uint16_t curr_line = 1;

	// while the offset in the memory buffer is less than the totall length, to prevent overrun
	while (script->contents->offset < script->contents->length) {
		// create token from memory buffer contents
		bsl_token *token = bsl_read_token(script->contents);

		if (token != NULL) { // if the token was created

			// assign script to token
			token->offset.script = script;
			// set the line number in the script
			token->offset.line = curr_line;

			// checking if there was a parse error in the token
			bsl_error error = bsl_token_check_error(token);
			if (error != bsl_error_none) { // if there is an error
				// break from while loop, there is a problem with syntax
				break;
			}

			// if the last token parsed as a new line or comment then increase the line counter in the script file
			if (token->code == BSLTokenCode_id_newline || token->code == BSLTokenCode_id_comment) {
				// advancing tracking of line of script
				curr_line++;
			}

			// if the current ir item is null
			if (curr == NULL) {
				// make sure it isn't because it will cause derefs further down
				curr = calloc(1, sizeof(bsl_tkn_ir));
			}

			// if the previous ir item pointer isn't null
			if (prev != NULL) {
				// assign the current ir item to previous item's `next` to create a chain
				prev->next = curr;
			}

			// assign parsed token to the token pointer on the current ir item
			curr->token = token;
			// assign the previous ir item pointer to the previous pointer on the current ir item
			curr->prev = prev;

			// the previous ir item pointer is now the "current"
			prev = curr;
			// the current ir item pointer is now NULL because we are advancing
			curr = NULL;
		}
		else {
			// if the token wasn't created, break now
			break;
		}
	}

	// return the ir item sequence
	return token_ir;
}

// copy token ir sequence item
bsl_tkn_ir *bsl_token_ir_copy(bsl_tkn_ir *token_ir)
{
	// allocate new ir token sequence
	bsl_tkn_ir *new_ir = calloc(1, sizeof(bsl_tkn_ir));

	// check that the new token sequence is non-null and the item to copy is non-null
	if (new_ir != NULL && token_ir != NULL) {
		// clear the previous and next item pointers
		new_ir->prev = NULL;
		new_ir->next = NULL;

		// check to make sure the sequence item to copy has a token
		if (token_ir->token != NULL) {
			// allocate the new token object
			new_ir->token = calloc(1, sizeof(bsl_token));
			// copy the existing token
			memcpy(new_ir->token, token_ir->token, sizeof(bsl_token));
		}
	}
	// return copied token sequence item
	return new_ir;
}

// append token ir sequence item to existing
void bsl_token_ir_append(bsl_tkn_ir **token_ir, bsl_tkn_ir *append)
{
	bsl_tkn_ir *ir = (*token_ir);
	// check that the item to append isn't null
	if (append != NULL) {
		// perform a copy of the item to append and set it to the next token sequence item
		ir->next = bsl_token_ir_copy(append);
		// fix up the assigned token sequence item to have a parent
		ir->next->prev = ir;
	}

	// set the referenced token sequence item to be the one that was appended
	*token_ir = ir->next;
}

bsl_tkn_ir *bsl_token_ir_jump_head(bsl_tkn_ir *token_ir)
{
	// get the current token sequence item
	bsl_tkn_ir *curr = token_ir;

	// make sure it isn't null
	if (curr != NULL) {

		// while the previous item in the sequence isn't pointing to null, jump to that
		while (curr->prev != NULL) {

			curr = curr->prev;
		}
	}

	// this should return the head of the sequence
	return curr;
}

uint32_t bsl_token_ir_count(bsl_tkn_ir *token_ir)
{
	// initial count is zero
	uint32_t result = 0;
	// get the current position in the sequence
	bsl_tkn_ir *curr = token_ir;

	// while the item in the sequence isn't null
	while (curr != NULL) {
		// increase the token sequence item counter
		result++;
		// move to the next item in the sequence
		curr = curr->next;
	}
	// return total item count from starting position
	return result;
}

bsl_tkn_ir *bsl_token_ir_move(bsl_tkn_ir *token_ir, int8_t move)
{
	// get the initial position in the token sequence
	bsl_tkn_ir *curr = token_ir;
	// based on the index
	if (move > 0) { // move forward
		while (curr != NULL && move != 0) {
			move--;
			curr = curr->next;
		}
	}
	else if (move < 0) { // move backward
		while (curr != NULL && move != 0) {
			move++;
			curr = curr->prev;
		}
	}
	else {
		// do nothing
		// the passed move counter was zero so, don't move
	}
	// return the item based on the relative move position
	return curr;
}

void bsl_token_ir_release_sequence(bsl_tkn_ir *sequence)
{
	bsl_tkn_ir *curr = sequence;

	while (curr != NULL) {
		bsl_tkn_ir *temp = curr->next;

		bsl_token_ir_release(curr);

		curr = temp;
	}
}

void bsl_token_ir_release(bsl_tkn_ir *token_ir)
{
	if (token_ir != NULL) {

		if (token_ir->token != NULL) {
			free(token_ir->token);

			token_ir->token = NULL;
		}

		if (token_ir->prev != NULL) {
			token_ir->prev->next = NULL;
		}
		token_ir->prev = NULL;

		if (token_ir->next != NULL) {
			token_ir->next->prev = NULL;
		}
		token_ir->next = NULL;

		free(token_ir);
		token_ir = NULL;
	}
}