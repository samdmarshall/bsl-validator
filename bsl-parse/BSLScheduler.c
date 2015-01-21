//
//  BSLScheduler.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/2/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLScheduler.h"
#include "BSLCoreTimer.h"

bsl_scheduler * bsl_scheduler_create(bsl_context *context) {
	bsl_scheduler *scheduler = calloc(1, sizeof(bsl_scheduler));
	scheduler->stack = calloc(1, sizeof(bsl_schedule_item));
	scheduler->current = scheduler->stack;
	
	if (scheduler != NULL) {
		
		bsl_stack_scope *curr = context->stack->state;
		
		bsl_schedule_item *prev = NULL;
		
		while (curr != NULL) {
			
			bsl_symbol *symbol = curr->symbol;
			
			if (symbol != NULL) {
				
				switch (symbol->type) {
					case bsl_symbol_type_variable: {
						break;
					}
					case bsl_symbol_type_function: {
						break;
					}
					case bsl_symbol_type_statement: {
						scheduler->current->statement = &(symbol->u.expr);
						break;
					}
					default: {
						break;
					}
				}
				
				scheduler->current->item_count = 1;
				scheduler->current->items = calloc(scheduler->current->item_count, sizeof(bsl_schedule_item));
				
				scheduler->current->parent = prev;
				
				prev = scheduler->current;
				
				scheduler->current = scheduler->current->items;
			}
			
			curr = curr->next;
		}
	}
	
	scheduler->current = scheduler->stack;
	
	return scheduler;
}

void bsl_scheduler_run(bsl_scheduler *scheduler) {
	struct time_interval interval = {0};
	// once every 1/60th of a second
	interval.tv.tv_sec = 0;
	interval.tv.tv_usec = kMicrosecondsPerFrame;
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
					scheduler->error = bsl_runtime_error_invalid_sleep;
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
			// create
			
			// assign
			
			break;
		}
		default: {
			break;
		}
	}
}