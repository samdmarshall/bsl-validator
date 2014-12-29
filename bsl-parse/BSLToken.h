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

bsl_token * read_token(mem_buff *text);

int check_token_error(bsl_token *token);

#endif /* defined(__bsl_parse__BSLToken__) */
