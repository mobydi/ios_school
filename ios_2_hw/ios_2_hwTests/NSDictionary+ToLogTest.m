//
//  NSDictionary+ToLogTest.m
//  ios_2_hw
//
//  Created by Ilya on 8/8/12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "NSDictionary+ToLogTest.h"

@implementation NSDictionary_ToLogTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testCategoryNSDictionaryToLogWithSomeElements
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"s", @"key1",
                                @"string", @"key2",
                                @44, @"key3",
                                @5.6, @"key4",
                                nil];
    NSString *correctString = @"key1:s, key2:string, key3:44, key4:5.6";
    STAssertEqualObjects([dictionary toLog], correctString, @"Strings should be the same");
}

- (void)testCategoryNSDictionaryToLogWithNilElements
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:nil];
    NSString *correctString = @"";
    STAssertEqualObjects([dictionary toLog], correctString, @"Strings should be the same");
}

@end
