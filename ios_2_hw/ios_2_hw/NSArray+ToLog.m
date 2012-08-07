//
//  NSArray+ToLog.m
//  ios_2_hw
//
//  Created by ilya on 08.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "NSArray+ToLog.h"

@implementation NSArray (ToLog)

-(NSString*)toLog
{
    return [self componentsJoinedByString:@", "];
}

@end
