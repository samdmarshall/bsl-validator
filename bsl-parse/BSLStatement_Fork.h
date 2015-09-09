//
//  BSLStatement_Fork.h
//  bsl-parse
//
//  Created by Samantha Marshall on 1/8/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLStatement_Fork__
#define __bsl_parse__BSLStatement_Fork__

#include "BSLPrivate.h"

bsl_statement_fork bsl_statement_fork_create(bsl_tkn_ir **token, bsl_context *context);

void bsl_statement_fork_action(bsl_context **context, bsl_statement *statement, bsl_script_offset offset);

#endif /* defined(__bsl_parse__BSLStatement_Fork__) */
