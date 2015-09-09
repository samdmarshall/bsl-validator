//
//  BSLStack.h
//  bsl-parse
//
//  Created by Samantha Marshall on 12/29/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLStack__
#define __bsl_parse__BSLStack__

#include "BSLPrivate.h"

void bsl_stack_init(bsl_stack *stack_frame);

void bsl_stack_release(bsl_stack *frame);

void bsl_stack_increment(bsl_context *context, bsl_symbol *symbol);

void bsl_stack_decrement(bsl_context *context);

bsl_symbol *bsl_stack_search_scope(char *name, bsl_context *context);

#endif /* defined(__bsl_parse__BSLStack__) */
