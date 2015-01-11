//
//  BSLTokenDefinitions.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef bsl_parse_BSLTokenDefinitions_h
#define bsl_parse_BSLTokenDefinitions_h

#include "BSLPrivate.h"

/*
 if ( CONDITIONAL ) {
 
 }
 else if ( CONDITIONAL ) {
 
 }
 else {
 
 }
 
 schedule FUNCTION_CALL at TIME_INT
 
 iterate over IDENTIFIER using IDENTIFIER {
 
 }
 
 sleep TIME_INT
 
 fork FUNCTION_CALL
 
 ? repeat FUNCTION_CALL every TIME_INT
 
 */

// returns the code type of the passed token
bsl_token_code bsl_token_resolve_identifier(bsl_token *token);

#endif
