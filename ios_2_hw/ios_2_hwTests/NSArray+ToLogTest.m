//
//  NSArray+ToLogTest.m
//  ios_2_hw
//
//  Created by ilya on 08.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "NSArray+ToLogTest.h"


@implementation NSArray_ToLogTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testCategoryNSArrayToLogWithSomeElements
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"string", @555, @"L", @3, @"t", @5.5, nil];
    NSString *correctString = @"string, 555, L, 3, t, 5.5";
    
    STAssertEqualObjects([array toLog], correctString, @"String should be the same");
}

- (void)testCategoryNSArrayToLogWithNilElements
{
    NSArray *array = [[NSArray alloc] init];
    NSString *correctString = @"";
    
    STAssertEqualObjects([array toLog], correctString, @"String should be the same");
}

@end
