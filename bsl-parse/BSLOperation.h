//
//  BSLOperation.h
//  bsl-parse
//
//  Created by Samantha Marshall on 1/14/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLOperation__
#define __bsl_parse__BSLOperation__

#include "BSLPrivate.h"

bsl_operation *bsl_operation_create(bsl_context *context, bsl_tkn_ir *cond_ir);

int8_t bsl_operation_evaluation(bsl_context **context, bsl_operation *op);

// note that this doesn't release the operation's statement, they must be released separately
void bsl_operation_release(bsl_operation *op);

void bsl_operation_statement_release(bsl_operation_statement *statement);

#endif /* defined(__bsl_parse__BSLOperation__) */
