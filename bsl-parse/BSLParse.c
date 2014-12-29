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

bsl_tkn_ir * bsl_token_ir_generate_from_script(bsl_script *script) {
	bsl_tkn_ir *token_ir = calloc(1, sizeof(bsl_tkn_ir));
	
	bsl_tkn_ir *prev = NULL;
	bsl_tkn_ir *curr = token_ir;
	
	uint16_t curr_line = 1;
	
	while (script->contents->offset < script->contents->length) {
		bsl_token *token = read_token(script->contents);
		
		if (token != NULL) {
			
			BSLTokenReadError error = check_token_error(token);
			if (error != BSLTokenReadError_None) {
				break;
			}
			
			token->offset.script = script;
			token->offset.line = curr_line;
			
			if (token->code == BSLTokenCode_id_newline || token->code == BSLTokenCode_id_comment) {
				curr_line++;
			}
			
			if (curr == NULL) {
				curr = calloc(1, sizeof(bsl_tkn_ir));
			}
			
			if (prev != NULL) {
				prev->next = curr;
			}
			
			curr->token = token;
			curr->prev = prev;
		
			prev = curr;
			curr = NULL;
			
		}
		else {
			break;
		}
	}
	
	return token_ir;
}