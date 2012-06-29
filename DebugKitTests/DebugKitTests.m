//
//  DebugKitTests.m
//  DebugKitTests
//
//  Created by Chad Gibbons on 6/26/12.
//  Copyright (c) 2012 Nuclear Bunny Studios, LLC. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//


#import "DebugKitTests.h"
#import "DebugKit.h"

@implementation DebugKitTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testHexDump
{
    const char *str = "hello, world!";
    NSLog(@"Dump:\n%@\n", hexDump(str, strlen(str)));

    NSString *dump = [[[NSData alloc] initWithBytes:"how now brown cow abcdefghijklmnopqrstuv" length:32] hexDump];
    NSLog(@"dump!\n%@\n", dump);
    STAssertNotNil(dump, @"foo");

    NSString *s = @"hello\b there\n\n";
    NSLog(@"dump!!\n%@\n",[s hexDump:NSASCIIStringEncoding]);
    
    NSString *t = @"yeah, baby!!!\n\b\b";
    NSLog(@"Unicode dump!!!\n%@\n", [t hexDump:NSUnicodeStringEncoding]);
    NSLog(@"UTF8 dump!!!\n%@\n", [t hexDump:NSUTF8StringEncoding]);
    NSLog(@"ASCII dump!!!\n%@\n", [t hexDump:NSASCIIStringEncoding]);
    
    NSString *u = @"How now, brown cow.";
    NSLog(@"Dump:\n%@\n", [u hexDump:NSUnicodeStringEncoding]);
}

-(void)testNonPrintables
{
    const char buffer[13] = { 130,155,255,254,1,10,13,15,'A','B','C',127,126 };
    NSString *dump = hexDump(buffer, sizeof(buffer));
    NSLog(@"dump\n%@\n", dump);
}


@end
