//
//  NSDictionary+ToLog.m
//  ios_2_hw
//
//  Created by Ilya on 8/8/12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "NSDictionary+ToLog.h"

@implementation NSDictionary (ToLog)

-(NSString*) toLog
{
    NSMutableString *resultString = [NSMutableString string];
    for (NSString* key in [[self allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]){
        if ([resultString length]>0)
            [resultString appendString:@", "];
        [resultString appendFormat:@"%@:%@", key, [self objectForKey:key]];
    }
    return resultString;
}

@end
