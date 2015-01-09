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

OniScriptContext * LoadScriptsFromLevelPath(char *path) {
	OniScriptContext *context = calloc(1, sizeof(OniScriptContext));
	
	if (context != NULL) {
		context->scripts = calloc(1, sizeof(bsl_script));
		context->script_count = 0;
		
		DIR *dir;
		struct dirent *ent;
		dir = opendir(path);
		
		while ((ent = readdir(dir)) != NULL) {
			char *file_name = ent->d_name;
			
			if (ent->d_namlen > 4) {
				char *file_extension = &(file_name[ent->d_namlen - 4]);
			
				if (strncmp(file_extension, ".bsl", sizeof(char[4])) == 0) {
					context->scripts = realloc(context->scripts, sizeof(bsl_script)*(context->script_count + 1));
					
					context->scripts[context->script_count].fd = file_ref_create(ent, dir);
					
					OpenScriptFromFileInDir(path, ent, dir, &(context->scripts[context->script_count]));
					
					context->script_count++;
				}
			}
		}
	}
	
	return context;
}

int EvaluateContext(OniScriptContext *context) {
	int result = 0;
	
	bsl_context *eval_context = bsl_context_create();
	
	for (uint32_t index = 0; index < context->script_count; index++) {
		bsl_script *script = &(context->scripts[index]);
		
		bsl_tkn_ir *token_ir = bsl_token_ir_generate_from_script(script);
		
		eval_context = bsl_evaluate_ir(token_ir, eval_context);
		
		if (bsl_context_check_error(eval_context) != bsl_error_none) {
			break;
		}
	}
	
	// eval `main`
	result = bsl_symbol_execute("main", eval_context);
	
	return result;
}


void ScriptContextRelease(OniScriptContext *context) {
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