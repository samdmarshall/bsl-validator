//
//  BSLScheduler.h
//  bsl-parse
//
//  Created by Sam Marshall on 1/2/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLScheduler__
#define __bsl_parse__BSLScheduler__

#include "BSLPrivate.h"

void bsl_scheduler_run(bsl_scheduler *scheduler);

uint8_t bsl_scheduler_update(void *context, struct timeval interval);

void bsl_scheduler_evaluate_statement(bsl_scheduler *scheduler, bsl_schedule_item *item, struct timeval interval);

#endif /* defined(__bsl_parse__BSLScheduler__) */
