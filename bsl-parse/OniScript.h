//
//  OniScript.h
//  bsl-parse
//
//  Created by Samantha Marshall on 12/27/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#ifndef __bsl_parse__OniScript__
#define __bsl_parse__OniScript__

#include "BSLPrivate.h"

typedef struct OniScriptContext OniScriptContext;

struct OniScriptContext {
	bsl_script *scripts;
	uint32_t script_count;
};

OniScriptContext *LoadScriptsFromLevelPath(char *path);

int EvaluateContextSyntax(OniScriptContext *context, bsl_context **script_context);

int EvaluateContextExec(bsl_context *script_context);

void ScriptContextRelease(OniScriptContext *context);

#endif /* defined(__bsl_parse__OniScript__) */
