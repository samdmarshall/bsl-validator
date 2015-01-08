//
//  FileAccess.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "FileAccess.h"

file_ref * file_ref_create(struct dirent *ent, DIR *dir) {
	file_ref *fd = calloc(1, sizeof(file_ref));
	
	if (fd != NULL) {
		fd->name = calloc(1, sizeof(char[ent->d_namlen + 1]));
		memcpy(fd->name, ent->d_name, sizeof(char[ent->d_namlen]));
		
		fd->dir = dir;
	}
	
	return fd;
}

void file_ref_release(file_ref *ref) {
	if (ref != NULL) {
		if (ref->name != NULL) {
			free(ref->name);
		}
		
		free(ref);
	}
}

mem_buff * mem_buff_copy(char *buff, size_t length) {
	mem_buff *buffer = calloc(1, sizeof(mem_buff));
	
	if (buffer != NULL) {
		buffer->data = calloc(length, sizeof(char));
		memcpy(buffer->data, buff, length);
		buffer->length = (uint32_t)length;
	}
	
	return buffer;
}

mem_buff * mem_buff_create(char *path) {
	mem_buff *buffer = calloc(1, sizeof(mem_buff));
	if (path) {
		FILE *file = fopen(path, "r");
		if (file) {
			fseek(file, 0, SEEK_END);
			buffer->length = (uint32_t)ftell(file);
			fseek(file, 0, SEEK_SET);
			buffer->data = calloc(buffer->length, 1);
			fread(buffer->data, buffer->length, 1, file);
		}
		fclose(file);
	}
	return buffer;
}

void mem_buff_release(mem_buff *buff) {
	if (buff->data != NULL) {
		free(buff->data);
	}
	free(buff);
}