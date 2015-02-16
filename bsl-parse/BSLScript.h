//
//  BSLScript.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLScript__
#define __bsl_parse__BSLScript__

#include "BSLPrivate.h"

bsl_script *bsl_script_create();
bsl_script *bsl_script_create_with_string(char *string);

void bsl_script_release(bsl_script *script);

char *bsl_script_copy_line(bsl_script *script, uint16_t index);

void OpenScriptFromFileInDir(char *dir_path, struct dirent *ent, DIR *dir, bsl_script *script);

#endif /* defined(__bsl_parse__BSLScript__) */
