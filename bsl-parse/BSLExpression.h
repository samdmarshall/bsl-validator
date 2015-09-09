//
//  BSLExpression.h
//  bsl-parse
//
//  Created by Samantha Marshall on 12/27/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLExpression__
#define __bsl_parse__BSLExpression__

#include "BSLPrivate.h"

bsl_expression *bsl_expression_create(bsl_context *context);

void bsl_expression_release(bsl_expression *expression);

bsl_expression *bsl_expression_parse(bsl_tkn_ir **item, bsl_context *context);

int bsl_expression_check_end(bsl_token_code code);

#endif /* defined(__bsl_parse__BSLExpression__) */
