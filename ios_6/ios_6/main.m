//
//  main.m
//  ios_6
//
//  Created by ilya on 18.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyClass.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@ AND NOT SELF BEGINSWITH[cd] %@", @"aa", @"aa"];
        NSArray *string = @[@"AAbcd", @"BCaadd", @"bbccdd"];
        
        NSArray *filteredArray = [string filteredArrayUsingPredicate:predicate];
        NSLog(@"%@", filteredArray);
        
        
        MyClass *class = [[MyClass alloc] init];
        [class draw];
    }
}
