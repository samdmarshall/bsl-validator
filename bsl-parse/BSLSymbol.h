//
//  BSLSymbol.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/27/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLSymbol__
#define __bsl_parse__BSLSymbol__

#include "BSLPrivate.h"

char * bsl_symbol_get_name(bsl_symbol *symbol);

bsl_symbol * bsl_symbol_create(bsl_symbol_type type);

void bsl_symbol_release(bsl_symbol *symbol);

#endif /* defined(__bsl_parse__BSLSymbol__) */
