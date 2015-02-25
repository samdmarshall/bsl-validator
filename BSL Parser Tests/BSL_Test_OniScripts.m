//
//  BSL_Test_OniScripts.m
//  bsl-parse
//
//  Created by Sam Marshall on 2/24/15.
//  Copyright (c) 2015 Sam Marshall. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#include "BSL_Test_Header.h"

@interface BSL_Test_OniScripts : XCTestCase

@end

@implementation BSL_Test_OniScripts

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_Airport {
	char *script_path = OniScriptPath(@"Airport");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_Airport_III {
	char *script_path = OniScriptPath(@"Airport_III");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_compound {
	char *script_path = OniScriptPath(@"compound");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_dream_lab {
	char *script_path = OniScriptPath(@"dream_lab");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_EnvWarehouse {
	char *script_path = OniScriptPath(@"EnvWarehouse");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_lab {
	char *script_path = OniScriptPath(@"lab");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_manplant {
	char *script_path = OniScriptPath(@"manplant");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_neuro {
	char *script_path = OniScriptPath(@"neuro");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_power {
	char *script_path = OniScriptPath(@"power");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_power_II {
	char *script_path = OniScriptPath(@"power_II");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_roof {
	char *script_path = OniScriptPath(@"roof");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_state {
	char *script_path = OniScriptPath(@"state");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_tctf {
	char *script_path = OniScriptPath(@"tctf");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

- (void)test_tctf_ii {
	char *script_path = OniScriptPath(@"tctf_ii");
	
	OniScriptContext *new_context = LoadScriptsFromLevelPath(script_path);
	
	int result = EvaluateContext(new_context);
	
	ScriptContextRelease(new_context);
	
	XCTAssertEqual(result, 0);
}

@end
