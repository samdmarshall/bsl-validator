//
//  BSLStatement_Conditional.h
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLStatement_Conditional__
#define __bsl_parse__BSLStatement_Conditional__

#include "BSLPrivate.h"

bsl_statement_conditional bsl_statement_conditional_create(bsl_tkn_ir **token, bsl_context *context, bsl_interpreted_code interp, uint32_t *index);

bsl_statement_conditional_case bsl_statement_conditional_case_create();

int8_t bsl_conditional_evaluation(bsl_conditional *cond, bsl_context **context);

#endif /* defined(__bsl_parse__BSLStatement_Conditional__) */
