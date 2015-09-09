//
//  BSLScript.c
//  bsl-parse
//
//  Created by Samantha Marshall on 12/27/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#include "BSLScript.h"

bsl_script *bsl_script_create()
{
	bsl_script *script = calloc(1, sizeof(bsl_script));

	if (script != NULL) {
	}

	return script;
}

bsl_script *bsl_script_create_with_string(char *string)
{
	bsl_script *script = bsl_script_create();

	if (script != NULL) {
		// moving string into a memory buffer structure
		script->contents = mem_buff_copy(string, strlen(string));
		// this has no file descriptor
		script->fd = NULL;
	}

	return script;
}

void bsl_script_release(bsl_script *script)
{
	if (script != NULL) {

		if (script->contents != NULL) {
			mem_buff_release(script->contents);
		}

		if (script->fd != NULL) {
			file_ref_release(script->fd);
		}

		free(script);
	}
}

char *bsl_script_copy_line(bsl_script *script, uint16_t index)
{
	uint16_t counter = 1;
	char *line = calloc(counter, sizeof(char));

	char *curr = &(script->contents->data[index]);

	while (curr[0] != '\n' && curr[0] != '\r') {
		line = realloc(line, sizeof(char) * (counter + 1));

		line[counter] = '\0';
		line[counter - 1] = curr[0];

		curr = &(script->contents->data[index + counter]);
		counter++;
	}

	return line;
}

void OpenScriptFromFileInDir(char *dir_path, struct dirent *ent, DIR *dir, bsl_script *script)
{
	script->fd = file_ref_create(ent, dir);

	size_t path_length = strlen(dir_path) + 1 + ent->d_namlen + 1;
	char *full_path = calloc(path_length, sizeof(char));
	snprintf(full_path, path_length, "%s/%s", dir_path, ent->d_name);

	script->contents = mem_buff_create(full_path);
}