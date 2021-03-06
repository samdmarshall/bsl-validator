//
//  BSLStatement_Iterate.h
//  bsl-parse
//
//  Created by Samantha Marshall on 1/8/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLStatement_Iterate__
#define __bsl_parse__BSLStatement_Iterate__

#include "BSLPrivate.h"

bsl_statement_iterate bsl_statement_iterate_create(bsl_tkn_ir **token, bsl_context *context, bsl_interpreted_code interp, uint32_t *index);

void bsl_statement_iterate_action(bsl_context **context, bsl_statement *statement, bsl_script_offset offset);

#endif /* defined(__bsl_parse__BSLStatement_Iterate__) */
