//
//  BSLStatement_Var.h
//  bsl-parse
//
//  Created by Sam Marshall on 1/8/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#ifndef __bsl_parse__BSLStatement_Var__
#define __bsl_parse__BSLStatement_Var__

#include "BSLPrivate.h"

bsl_statement_var bsl_statement_const_create(bsl_tkn_ir **token, bsl_context *context);

bsl_statement_var bsl_statement_var_create(bsl_tkn_ir **token, bsl_context *context);

bsl_statement_var bsl_statement_var_assign(bsl_tkn_ir **token, bsl_context *context);

#endif /* defined(__bsl_parse__BSLStatement_Var__) */
