//
//  MyClass.m
//  ios_6
//
//  Created by ilya on 18.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "MyClass.h"

@interface MyClass (){
    @private NSNumber *value;
}
@end

@implementation MyClass


static NSString *const MyKeyNotification = @"com.notification.application";

- (id) init
{
    if (self = [super init])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doing:) name:MyKeyNotification object:nil];
    }
    return self;
}

- (void)draw
{
    NSNotificationCenter *notif = [NSNotificationCenter defaultCenter];
    [notif postNotificationName:MyKeyNotification object:self ];
}

- (void)doing:(NSNotification *)notification
{
    //NSNotificationQueue
    if ([notification.name isEqualToString:MyKeyNotification])
        NSLog(@"NSNotification");
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
