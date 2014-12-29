//
//  BSLFunction.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLFunction__
#define __bsl_parse__BSLFunction__

#include "BSLPrivate.h"
#include "BSLContext.h"

bsl_function bsl_function_parse(bsl_tkn_ir **item, bsl_context *context);

void bsl_function_release(bsl_function func);

#endif /* defined(__bsl_parse__BSLFunction__) */
