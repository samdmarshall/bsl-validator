//
//  BSLStatement_Iterate.h
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLStatement_Iterate__
#define __bsl_parse__BSLStatement_Iterate__

#include "BSLPrivate.h"

bsl_statement_iterate bsl_statement_iterate_create(bsl_tkn_ir **token, bsl_context *context, bsl_interpreted_code interp, uint32_t *index);

#endif /* defined(__bsl_parse__BSLStatement_Iterate__) */
