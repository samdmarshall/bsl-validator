//
//  TimeUtil.h
//  bsl-parse
//
//  Created by Samantha Marshall on 1/11/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#ifndef __bsl_parse__TimeUtil__
#define __bsl_parse__TimeUtil__

#include <unistd.h>
#include <stdint.h>
#if __linux__
#include <sys/time.h>
#endif

#define kMicroseconds 1000000
#define kMicrosecondsPerFrame 16666

typedef struct time_interval time_interval;

struct time_interval {
	struct timeval tv;
	uint16_t ips; // iterations per second
};

typedef enum timeval_comp {
	timeval_comp_lt,
	timeval_comp_eq,
	timeval_comp_gt
} timeval_comp;

timeval_comp timeval_compare(struct timeval a, struct timeval b);

void timeval_add(struct timeval *a, struct timeval b);
void timeval_sub(struct timeval *a, struct timeval b);

#endif /* defined(__bsl_parse__TimeUtil__) */
