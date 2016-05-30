//
//  BSL_Parser_Tests.m
//  BSL Parser Tests
//
//  Created by Samantha Marshall on 2/24/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#include "BSL_Test_Header.h"

@interface BSL_Parser_Tests : XCTestCase

@end

@implementation BSL_Parser_Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_LoadScript {
	char *script_path = TestScriptPath(@"Parser", @"Load Script");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	bsl_context *eval_context = NULL;
	
	int result = EvaluateContextSyntax(new_context, &eval_context);
	
	ScriptContextRelease(new_context);
	
    XCTAssertEqual(result, 0);
}

- (void)test_ParseMain {
	char *script_path = TestScriptPath(@"Parser", @"Parse Main");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	bsl_context *eval_context = NULL;
	
	int result = EvaluateContextSyntax(new_context, &eval_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_ParseFunctions {
	char *script_path = TestScriptPath(@"Parser", @"Parse Functions");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	bsl_context *eval_context = NULL;
	
	int result = EvaluateContextSyntax(new_context, &eval_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}


- (void)test_ParseFunctionArgs {
	char *script_path = TestScriptPath(@"Parser", @"Parse Function Args");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	bsl_context *eval_context = NULL;
	
	int result = EvaluateContextSyntax(new_context, &eval_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}


- (void)test_Variable {
	char *script_path = TestScriptPath(@"Parser", @"Variable");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	bsl_context *eval_context = NULL;
	
	int result = EvaluateContextSyntax(new_context, &eval_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

@end
