//
//  BSLToken.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLToken__
#define __bsl_parse__BSLToken__

#include "BSLPrivate.h"

// returns a bsl token from the passed text memory buffer, the buffer position is updated internally
bsl_token * read_token(mem_buff *text);

// returns error type if there was a problem parsing a token
int check_token_error(bsl_token *token);

#endif /* defined(__bsl_parse__BSLToken__) */
