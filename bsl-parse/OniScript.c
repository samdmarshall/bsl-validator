//
//  OniScript.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "OniScript.h"
#include "BSLScript.h"
#include "BSLContext.h"
#include "BSLEvaluate.h"
#include "BSLParse.h"
#include "BSLExecute.h"
#include "BSLScheduler.h"

OniScriptContext *LoadScriptsFromLevelPath(char *path)
{
	// creating script loading context object
	OniScriptContext *context = calloc(1, sizeof(OniScriptContext));

	if (context != NULL) {
		// creating script object
		context->scripts = bsl_script_create();
		context->script_count = 0;

		// setup for searching through the passed directory
		DIR *dir;
		struct dirent *ent;
		dir = opendir(path);

		// iterate over directory items
		while ((ent = readdir(dir)) != NULL) {
			// get file name for currently listed item
			char *file_name = ent->d_name;

			// check if file name is longer than 4 characters
			if (ent->d_namlen > 4) {
				// get the offset of where the extention would be
				char *file_extension = &(file_name[ent->d_namlen - 4]);

				// compare the extension ".bsl" to the end of the file name for a match
				if (strncmp(file_extension, ".bsl", sizeof(char[4])) == 0) {
					// this appears to be a valid script file, based on the name
					context->scripts = realloc(context->scripts, sizeof(bsl_script) * (context->script_count + 1));

					// create file ref for the script file
					context->scripts[context->script_count].fd = file_ref_create(ent, dir);

					// pass off ref of the script to be create
					OpenScriptFromFileInDir(path, ent, dir, &(context->scripts[context->script_count]));

					// increment the loaded script counter
					context->script_count++;
				}
			}
		}
	}

	// return loaded script context
	return context;
}

int EvaluateContext(OniScriptContext *context)
{
	int result = 0;

	bsl_context *eval_context = bsl_context_create();

	for (uint32_t index = 0; index < context->script_count; index++) {
		bsl_script *script = &(context->scripts[index]);

		printf("Parsing script \"%s\"...", script->fd->name);

		bsl_tkn_ir *token_ir = bsl_token_ir_generate_from_script(script);

		eval_context = bsl_evaluate_ir(token_ir, eval_context);

		if (bsl_context_check_error(eval_context) != bsl_error_none) {
			printf("%s\n", "[Failure]");

			result = -1;

			break; // ERROR ASSIGNMENT
		}
		else {
			printf("%s\n", "[Success]");
		}
	}
	printf("%s\n", "===================");

	// evaluate for parsing errors first
	if (bsl_context_check_error(eval_context) == bsl_error_none) {
		// eval `main`
		result = bsl_symbol_execute("main", eval_context);

		bsl_context_check_error(eval_context);

		//		bsl_scheduler *scheduler = bsl_scheduler_create(eval_context);

		//		bsl_scheduler_run(scheduler);
	}

	return result;
}

void ScriptContextRelease(OniScriptContext *context)
{
	if (context->script_count > 1) {
		closedir(context->scripts[1].fd->dir);
	}

	for (uint32_t index = 0; index < context->script_count; index++) {
		mem_buff_release(context->scripts[index].contents);
		file_ref_release(context->scripts[index].fd);
	}

	free(context->scripts);

	free(context);
}