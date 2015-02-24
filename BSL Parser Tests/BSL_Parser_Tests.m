//
//  BSL_Parser_Tests.m
//  BSL Parser Tests
//
//  Created by Sam Marshall on 2/24/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
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
	char *script_path = ScriptPath(@"Parser", @"Load Script");
    // This is an example of a functional test case.
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
    XCTAssertEqual(result, 0);
}

- (void)test_ParseMain {
	char *script_path = ScriptPath(@"Parser", @"Parse Main");
	// This is an example of a functional test case.
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_ParseFunctions {
	char *script_path = ScriptPath(@"Parser", @"Parse Functions");
	// This is an example of a functional test case.
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}


- (void)test_ParseFunctionArgs {
	char *script_path = ScriptPath(@"Parser", @"Parse Function Args");
	// This is an example of a functional test case.
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}


- (void)test_Variable {
	char *script_path = ScriptPath(@"Parser", @"Variable");
	// This is an example of a functional test case.
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

@end