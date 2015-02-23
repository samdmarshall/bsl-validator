//
//  BSLStatement_Sleep.h
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLStatement_Sleep__
#define __bsl_parse__BSLStatement_Sleep__

#include "BSLPrivate.h"

bsl_statement_sleep bsl_statement_sleep_create(bsl_tkn_ir **token, bsl_context *context);

void bsl_statement_sleep_action(bsl_context **context, bsl_statement *statement, bsl_script_offset offset);

#endif /* defined(__bsl_parse__BSLStatement_Sleep__) */
