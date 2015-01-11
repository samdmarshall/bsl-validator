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
	struct time_interval interval = {0};
	// once every 1/60th of a second
	interval.tv.tv_sec = 0;
	interval.tv.tv_usec = 16666;
	// 60 times a second
	interval.ips = 60;
	
	bsl_core_timer_create(interval, bsl_scheduler_update, scheduler);
}

uint8_t bsl_scheduler_update(void *context, struct time_interval interval) {
	uint8_t active = 0;
	
	bsl_scheduler *scheduler = (bsl_scheduler *)context;
	
	if (scheduler->current != NULL) {
		
		if (scheduler->current->item_count > 0) {
			active = 1;
		}
		
		for (uint32_t index = 0; index < scheduler->current->item_count; index++) {
			
			bsl_scheduler_evaluate_statement(scheduler, &(scheduler->current->items[index]), interval.tv);
		}
	}
	
	if (scheduler->current_tick < interval.ips) {
		scheduler->current_tick++;
	}
	else {
		scheduler->current_tick = 0;
		
		// advance on stack
	}
	
	return active;
}

void bsl_scheduler_evaluate_statement(bsl_scheduler *scheduler, bsl_schedule_item *item, struct timeval interval) {
	
	bsl_statement *statement = item->statement;
	
	switch (statement->type) {
		case bsl_statement_type_conditional: {
			break;
		}
		case bsl_statement_type_sleep: {
			timeval_add(&(statement->u.sleep.current), interval);
			
			// compare to statement->u.sleep.total
			switch (timeval_compare(statement->u.sleep.current, statement->u.sleep.total)) {
				case timeval_comp_lt: {
					// less than
					break;
				}
				case timeval_comp_eq: {
					// equal to
					break;
				}
				case timeval_comp_gt: {
					// greater than
					break;
				}
				default: {
					// error
					break;
				}
			}
			
			break;
		}
		case bsl_statement_type_fork: {
			break;
		}
		case bsl_statement_type_schedule: {
			break;
		}
		case bsl_statement_type_iterate: {
			break;
		}
		case bsl_statement_type_return: {
			break;
		}
		case bsl_statement_type_func: {
			break;
		}
		case bsl_statement_type_var: {
			break;
		}
		default: {
			break;
		}
	}
}