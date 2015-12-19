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

void bsl_frame_init(bsl_frame *stack_frame);

void bsl_frame_release(bsl_frame *frame);

void bsl_frame_increment(bsl_context *context, bsl_symbol *symbol);

void bsl_frame_decrement(bsl_context *context);

bsl_symbol *bsl_frame_search_scope(char *name, bsl_context *context);

#endif /* defined(__bsl_parse__BSLStack__) */
