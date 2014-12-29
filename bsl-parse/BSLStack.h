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

void bsl_stack_release(bsl_stack *stack);

#endif /* defined(__bsl_parse__BSLStack__) */