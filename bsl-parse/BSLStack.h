//
//  BSLStack.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/29/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLStack__
#define __bsl_parse__BSLStack__

#include "BSLPrivate.h"

bsl_stack_scope * bsl_stack_scope_create();

void bsl_stack_scope_release(bsl_stack_scope *scope);

bsl_stack * bsl_stack_create();

void bsl_stack_item_advance(bsl_stack_scope **scope, bsl_scope_type type, uint8_t depth);

void bsl_stack_release(bsl_stack *stack);

bsl_symbol * bsl_stack_search_scope(char *name, bsl_context *context);

#endif /* defined(__bsl_parse__BSLStack__) */
