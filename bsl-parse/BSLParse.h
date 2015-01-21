//
//  BSLParse.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLParse__
#define __bsl_parse__BSLParse__

#include "BSLPrivate.h"

// returns an allocated string representation of the passed token ir sequence
char * bsl_token_ir_copy_string(bsl_tkn_ir *token_ir);

// returns token ir sequence from passed script file
bsl_tkn_ir * bsl_token_ir_generate_from_script(bsl_script *script);


// copy token ir sequence item
bsl_tkn_ir * bsl_token_ir_copy(bsl_tkn_ir *token_ir);

// append token ir sequence item to existing
void bsl_token_ir_append(bsl_tkn_ir **token_ir, bsl_tkn_ir *append);

// jumps token ir sequence back to beginning
bsl_tkn_ir * bsl_token_ir_jump_head(bsl_tkn_ir *token_ir);

// returns total count from current token ir sequence item to end
uint32_t bsl_token_ir_count(bsl_tkn_ir *token_ir);

#endif /* defined(__bsl_parse__BSLParse__) */
