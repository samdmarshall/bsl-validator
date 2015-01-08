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

char * bsl_token_ir_copy_string(bsl_tkn_ir *token_ir);

bsl_tkn_ir * bsl_token_ir_generate_from_string(char *str);

bsl_tkn_ir * bsl_token_ir_generate_from_script(bsl_script *script);

#endif /* defined(__bsl_parse__BSLParse__) */
