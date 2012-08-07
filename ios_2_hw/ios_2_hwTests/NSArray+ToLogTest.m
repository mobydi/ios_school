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

- (void)testThreeElements
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"A", @"b", @1, @3, nil];
    NSString *correctString = @"A, b, 1, 3";

    STAssertEqualObjects([array toLog], correctString, @"String should be the same");
}

@end
