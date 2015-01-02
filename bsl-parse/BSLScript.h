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

void OpenScriptFromFileInDir(char *dir_path, struct dirent *ent, DIR *dir, bsl_script *script);

#endif /* defined(__bsl_parse__BSLScript__) */
