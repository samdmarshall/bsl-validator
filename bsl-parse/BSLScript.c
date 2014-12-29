//
//  BSLScript.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLScript.h"
#include "BSLGlobals.h"

bsl_script * bsl_script_init() {
	bsl_script *globals = calloc(1, sizeof(bsl_script));
	
	if (globals != NULL) {
		globals->contents = mem_buff_copy(BSL_GLOBAL_DEFINES, strlen(BSL_GLOBAL_DEFINES));
		globals->fd = NULL;
	}
	
	return globals;
}


void OpenScriptFromFileInDir(char *dir_path, struct dirent *ent, DIR *dir, bsl_script *script) {
	script->fd = file_ref_create(ent, dir);
	
	size_t path_length = strlen(dir_path)+1+ent->d_namlen+1;
	char *full_path = calloc(path_length, sizeof(char));
	snprintf(full_path, path_length, "%s/%s",dir_path,ent->d_name);
	
	script->contents = mem_buff_create(full_path);
}