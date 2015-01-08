//
//  BSLStatement.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/29/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLStatement__
#define __bsl_parse__BSLStatement__

#include "BSLPrivate.h"

bsl_statement bsl_statement_parse(bsl_tkn_ir **item, bsl_context *context, bsl_function_interpreted interp, uint32_t *index);

#endif /* defined(__bsl_parse__BSLStatement__) */
