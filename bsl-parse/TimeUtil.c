//
//  TimeUtil.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/11/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "TimeUtil.h"

#define kMicroseconds 1000000

timeval_comp timeval_compare(struct timeval a, struct timeval b) {
	if (a.tv_sec > b.tv_sec) {
		return timeval_comp_gt;
	}
	else if (a.tv_sec < b.tv_sec) {
		return timeval_comp_lt;
	}
	else {
		if (a.tv_usec > b.tv_usec) {
			return timeval_comp_gt;
		}
		else if (a.tv_usec < b.tv_usec) {
			return timeval_comp_lt;
		}
		else {
			return timeval_comp_eq;
		}
	}
}

void timeval_add(struct timeval *a, struct timeval b) {
	struct timeval value = *a;
	value.tv_usec += b.tv_usec;
	while (value.tv_usec % kMicroseconds > 1) {
		value.tv_usec -= kMicroseconds;
		value.tv_sec += 1;
	}
	value.tv_sec += b.tv_sec;
	
	*a = value;
}
void timeval_sub(struct timeval *a, struct timeval b) {
	struct timeval value = *a;
	if (value.tv_usec < b.tv_usec) {
		if (value.tv_sec > 0) {
			value.tv_sec -= 1;
			value.tv_usec += kMicroseconds;
		}
	}
	value.tv_usec -= b.tv_usec;
	
	if (value.tv_sec < b.tv_sec) {
		value.tv_sec = 0;
		value.tv_usec = 0;
	}
	else {
		value.tv_sec -= b.tv_sec;
	}
	
	*a = value;
}