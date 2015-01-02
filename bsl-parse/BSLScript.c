//
//  BSLScript.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLScript.h"

void OpenScriptFromFileInDir(char *dir_path, struct dirent *ent, DIR *dir, bsl_script *script) {
	script->fd = file_ref_create(ent, dir);
	
	size_t path_length = strlen(dir_path)+1+ent->d_namlen+1;
	char *full_path = calloc(path_length, sizeof(char));
	snprintf(full_path, path_length, "%s/%s",dir_path,ent->d_name);
	
	script->contents = mem_buff_create(full_path);
}