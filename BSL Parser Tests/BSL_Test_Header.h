//
//  BSL_Test_Header.h
//  bsl-parse
//
//  Created by Sam Marshall on 2/24/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef bsl_parse_BSL_Test_Header_h
#define bsl_parse_BSL_Test_Header_h

#include "OniScript.h"

#define TestScriptPath(a,b) (char *)[[[[[[[NSBundle bundleForClass:[self class]] resourceURL] URLByAppendingPathComponent:@"Test Scripts" isDirectory:YES] URLByAppendingPathComponent:a isDirectory:YES] URLByAppendingPathComponent:b isDirectory:YES] path] UTF8String]

#define OniScriptPath(a) (char *)[[[[[[[NSBundle bundleForClass:[self class]] resourceURL] URLByAppendingPathComponent:@"GameDataFolder" isDirectory:YES] URLByAppendingPathComponent:@"IGMD" isDirectory:YES] URLByAppendingPathComponent:a isDirectory:YES] path] UTF8String]

#endif
