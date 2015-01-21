//
//  BSLOperation.h
//  bsl-parse
//
//  Created by Sam Marshall on 1/14/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLOperation__
#define __bsl_parse__BSLOperation__

#include "BSLPrivate.h"

bsl_operation * bsl_operation_create(bsl_context *context, bsl_tkn_ir *cond_ir);

void bsl_operation_release(bsl_operation *op);

#endif /* defined(__bsl_parse__BSLOperation__) */
