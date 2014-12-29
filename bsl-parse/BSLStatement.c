//
//  BSLStatement.c
//  bsl-parse
//
//  Created by Sam Marshall on 12/29/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#include "BSLStatement.h"
#include "BSLTokenDefinitions.h"

bsl_statement bsl_statement_parse(bsl_tkn_ir **item, bsl_context *context) {
	bsl_statement expr = {0};
	
	bsl_tkn_ir *curr = (*item);
	
	printf("evaluate expression\n");
	bsl_token_code code = bsl_token_resolve_identifier(curr->token);
	
	switch (code) {
		case BSLTokenCode_id_schedule: {
			expr.type = bsl_statement_type_schedule;
			break;
		}
		case BSLTokenCode_id_iterate: {
			expr.type = bsl_statement_type_iterate;
			break;
		}
		case BSLTokenCode_id_return: {
			expr.type = bsl_statement_type_return;
			break;
		}
		case BSLTokenCode_id_sleep: {
			expr.type = bsl_statement_type_sleep;
			break;
		}
		case BSLTokenCode_id_fork: {
			expr.type = bsl_statement_type_fork;
			break;
		}
		case BSLTokenCode_id_if: {
			expr.type = bsl_statement_type_conditional;
			break;
		}
		default: {
			// error
			break;
		}
	}
	
	return expr;
}