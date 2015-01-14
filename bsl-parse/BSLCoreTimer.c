//
//  BSLCoreTimer.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/5/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "BSLCoreTimer.h"
#include <signal.h>
#include <time.h>
#include <errno.h>

void bsl_core_timer_create(struct time_interval interval, FPCallback update_callback, void *context) {
	
	int result = -1;
	int select_errno = 0;
	uint8_t active = 1;
	
	do {
		result = select(0, NULL, NULL, NULL, &(interval.tv));
		
		if (result < 0) {
			select_errno = errno;
		}
		
		if (update_callback != NULL) {
			active = update_callback(context, interval);
		}
		else {
			active = 0;
		}
		
	} while (active == 1);
	
	if (result < 0) {
		/* Handle other errors here. See select man page. */
	} else {
		/* Successful invocation of select(). */
	}
}