//
//  BSLStatement.h
//  bsl-parse
//
//  Created by Samantha Marshall on 12/29/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLStatement__
#define __bsl_parse__BSLStatement__

#include "BSLPrivate.h"

bsl_statement bsl_statement_parse(bsl_tkn_ir **item, bsl_context *context, bsl_interpreted_code interp, uint32_t *index);

int bsl_function_interp_expression_increment(bsl_tkn_ir **token, bsl_interpreted_code interp, uint32_t *index);

int bsl_function_interp_expression_decrement(bsl_tkn_ir **token, bsl_interpreted_code interp, uint32_t *index);

int bsl_function_interp_expression_increment_token(bsl_tkn_ir **item, bsl_interpreted_code interp, uint32_t *index);

int bsl_function_interp_expression_decrement_token(bsl_tkn_ir **item, bsl_interpreted_code interp, uint32_t *index);

#endif /* defined(__bsl_parse__BSLStatement__) */
