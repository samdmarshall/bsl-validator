//
//  BSL_Oni_Test_Airport.m
//  bsl-parse
//
//  Created by Samantha Marshall on 2/25/15.
//  Copyright (c) 2015 Samantha Marshall. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#include "BSL_Test_Header.h"

@interface BSL_Oni_Test_Airport : XCTestCase

@end

@implementation BSL_Oni_Test_Airport

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_checkpoint_0 {
	char *script_path = OniFullTestScriptPath(@"Airport", @"checkpoint_0");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_checkpoint_1 {
	char *script_path = OniFullTestScriptPath(@"Airport", @"checkpoint_1");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_checkpoint_2 {
	char *script_path = OniFullTestScriptPath(@"Airport", @"checkpoint_2");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_checkpoint_3 {
	char *script_path = OniFullTestScriptPath(@"Airport", @"checkpoint_3");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

@end
