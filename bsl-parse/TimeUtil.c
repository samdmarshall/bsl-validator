//
//  TimeUtil.c
//  bsl-parse
//
//  Created by Sam Marshall on 1/11/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#include "TimeUtil.h"

int timeval_compare(struct timeval a, struct timeval b) {
	if (a.tv_sec > b.tv_sec) {
		return 1;
	}
	else if (a.tv_sec < b.tv_sec) {
		return -1;
	}
	else {
		if (a.tv_usec > b.tv_usec) {
			return 1;
		}
		else if (a.tv_usec < b.tv_usec) {
			return -1;
		}
		else {
			return 0;
		}
	}
}