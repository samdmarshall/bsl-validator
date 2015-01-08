//
//  BSLContext.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLContext__
#define __bsl_parse__BSLContext__

#include "BSLPrivate.h"
#include "BSLDatabase.h"

bsl_context * bsl_context_create();

int bsl_context_check_error(bsl_context *context);

bsl_context * bsl_context_update(bsl_context *context, bsl_token *item_token);

void bsl_context_print_stack(bsl_context *context);

void bsl_context_reset_error_state(bsl_context *context);

void bsl_context_release(bsl_context *context);

#endif /* defined(__bsl_parse__BSLContext__) */
