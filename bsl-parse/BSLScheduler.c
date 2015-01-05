//
//  BSLScheduler.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/2/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLScheduler.h"
#include "BSLCoreTimer.h"

void bsl_scheduler_run(bsl_scheduler *scheduler) {
	struct timeval tv = { 0, 16666 }; // once every 1/60th of a second
	
	bsl_core_timer_create(tv, bsl_scheduler_update, scheduler);
}

uint8_t bsl_scheduler_update(void *context) {
	uint8_t active = 0;
	
	bsl_scheduler *scheduler = (bsl_scheduler *)context;
	
	if (scheduler->current != NULL) {
		
		if (scheduler->current->item_count > 0) {
			active = 1;
		}
		
	}
	
	
	return active;
}