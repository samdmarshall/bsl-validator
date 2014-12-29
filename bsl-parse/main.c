//
//  main.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include <stdio.h>
#include <getopt.h>

#include "OniScript.h"

static char *help_arg_def = "-h,--help";
static char *input_arg_def = "-i,--input";
static char *check_syntax_arg_def = "-s,--check-syntax";
static char *check_exec_arg_def = "-e,--check-exec";

enum BSLParseOptions {
	OptionsHelp = 0,
	OptionsInput,
	OptionsCheckSyntax,
	OptionsCheckExec,
	OptionsCount
};


static struct option long_options[OptionsCount] = {
	{"help", no_argument, 0, 'h'},
	{"input", required_argument, 0, 'i'},
	{"check_exec_arg_def-syntax", no_argument, 0, 's'},
	{"arch", no_argument, 0, 'e'},
};

static uint8_t options_enabled[OptionsCount] = {0};


void usage(void);

void usage() {
	printf("%s : display help\n",help_arg_def);
	printf("%s [directory] : specify an input script directory\n",input_arg_def);
	printf("%s : check the syntax of the input script\n",check_syntax_arg_def);
	printf("%s : check the execution of the input script\n",check_exec_arg_def);
}

int main(int argc, const char * argv[]) {
	char *input_path = NULL;
	uint8_t search_args = 1;
	int c;
	
	while (search_args == 1) {
		int option_index = 0;
		c = getopt_long(argc, (char * const *)argv, "hi:es", long_options, &option_index);
		if (c == -1) {
			break;
		}
		switch (c) {
			case 'h': {
				options_enabled[OptionsHelp]++;
				break;
			}
			case 'i': {
				if (optarg) {
					if (options_enabled[OptionsInput] < 1) {
						input_path = optarg;
						options_enabled[OptionsInput]++;
					}
				}
				break;
			}
			case 'e': {
				options_enabled[OptionsCheckExec]++;
				break;
			}
			case 's': {
				options_enabled[OptionsCheckSyntax]++;
				break;
			}
			default: {
				break;
			}
		}
		search_args = (((options_enabled[OptionsInput] && (options_enabled[OptionsCheckSyntax] || options_enabled[OptionsCheckExec])) || options_enabled[OptionsHelp]) ? 0 : 1 );
	}
	
	if (options_enabled[OptionsHelp]) {
		usage();
	}
	else if (input_path != NULL) {
		
		OniScriptContext *new_context = LoadScriptsFromLevelPath(input_path);
		
		int result = EvaluateContext(new_context);
		
		printf("Code: %i\n",result);
		
		ScriptContextRelease(new_context);
	}
	
    return 0;
}