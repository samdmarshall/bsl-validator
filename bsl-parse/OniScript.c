//
//  OniScript.c
//  bsl-parse
//
//  Created by Samantha Marshall on 12/27/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#include "OniScript.h"
#include "BSLScript.h"
#include "BSLContext.h"
#include "BSLEvaluate.h"
#include "BSLParse.h"
#include "BSLExecute.h"
#include "BSLStack.h"

#include "BSLSymbol.h"
#include "BSLStatement_Conditional.h"
#include "BSLStatement_Func.h"
#include "BSLStatement_Schedule.h"
#include "BSLStatement_Fork.h"
#include "BSLStatement_Sleep.h"
#include "BSLStatement_Iterate.h"

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

int EvaluateContextSyntax(OniScriptContext *context, bsl_context **script_context)
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

	if (script_context != NULL) {
		*script_context = eval_context;
	}
	else {
		printf("Passed NULL to context evaluation!\n");
	}
	
	return result;
}

int EvaluateContextExec(bsl_context *script_context)
{
	int result = 0;
	
	if (script_context != NULL) {
		
		// evaluate for parsing errors first
		if (bsl_context_check_error(script_context) == bsl_error_none) {
			// eval `main`
			bsl_symbol *main_symbol = bsl_db_get_global("main", script_context);
			
			bsl_frame_increment(script_context, main_symbol);
			
			bsl_context_add_task(&script_context, main_symbol);
			
			while (script_context->task_count != 0 && result == 0) {
				
				for (uint32_t index = 0; index < script_context->task_count; index++) {
					script_context->task_pos = index;
					
					bsl_task *task = &(script_context->tasks[index]);
					if (task->current_statement_index < task->statement_count) {
						
						bsl_symbol *current_symbol = &(task->statements[task->current_statement_index]);
						bsl_statement *current_statement = &(current_symbol->u.expr);
						
						task->current_statement_index += 1;
						
						if (current_statement->type == bsl_statement_type_return) {
							break;
						}
						
						bsl_script_offset offset = bsl_script_offset_from_symbol(current_symbol);
						
						switch (current_statement->type) {
							case bsl_statement_type_conditional: {
								bsl_statement_conditional_action(&script_context, current_statement, offset);
								break;
							}
							case bsl_statement_type_func: {
								bsl_statement_func_action(&script_context, current_statement, offset);
								break;
							}
							case bsl_statement_type_schedule: {
								bsl_statement_schedule_action(&script_context, current_statement, offset);
								break;
							}
							case bsl_statement_type_fork: {
								bsl_statement_fork_action(&script_context, current_statement, offset);
								break;
							}
							case bsl_statement_type_sleep: {
								bsl_statement_sleep_action(&script_context, current_statement, offset);
								break;
							}
							case bsl_statement_type_iterate: {
								bsl_statement_iterate_action(&script_context, current_statement, offset);
								break;
							}
							default: {
								break;
							}
						}
						
					}
					
				}
				
				if (bsl_context_check_error(script_context) != bsl_error_none) {
					// failed to execute without error
					result = -1;
				}
				
				
				if (bsl_context_finished_tasks(script_context) == 1) {
					break;
				}
				
			}
			
		}
		
		bsl_context_release(script_context);
	}
	
	return result;
}

void ScriptContextRelease(OniScriptContext *context)
{
	if (context->script_count > 1) {
		closedir(context->scripts[0].fd->dir);
	}

	for (uint32_t index = 0; index < context->script_count; index++) {

		mem_buff_release(context->scripts[index].contents);
		file_ref_release(context->scripts[index].fd);
	}

	free(context->scripts);

	free(context);
}