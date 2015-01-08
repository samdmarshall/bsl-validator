//
//  FileAccess.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__FileAccess__
#define __bsl_parse__FileAccess__

#include <stdlib.h>
#include <dirent.h>
#include <stdio.h>
#include <string.h>

#pragma mark -
#pragma mark FileRef

typedef struct file_ref file_ref;

struct file_ref {
	char *name;
	DIR *dir;
};

file_ref * file_ref_create(struct dirent *ent, DIR *dir);

void file_ref_release(file_ref *ref);

#pragma mark -
#pragma mark MemBuff

typedef struct mem_buff mem_buff;

struct mem_buff {
	char *data;
	int32_t length;
	int32_t offset;
};

mem_buff * mem_buff_copy(char *buff, size_t length);

mem_buff * mem_buff_create(char *path);

void mem_buff_release(mem_buff *buff);

#endif /* defined(__bsl_parse__FileAccess__) */
