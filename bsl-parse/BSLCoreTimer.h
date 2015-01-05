//
//  BSLCoreTimer.h
//  bsl-parse
//
//  Created by Sam Marshall on 1/5/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLCoreTimer__
#define __bsl_parse__BSLCoreTimer__

#include "BSLPrivate.h"

void bsl_core_timer_create(struct timeval tv, FPCallback update_callback, void *context);

#endif /* defined(__bsl_parse__BSLCoreTimer__) */
