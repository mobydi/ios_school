//
//  main.m
//  ios_6_1
//
//  Created by ilya on 15.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyClass :NSObject
@property(nonatomic, copy) NSString *prop;
@property(nonatomic, assign) NSInteger pr;
@end

@implementation MyClass
+(MyClass *) myClassWithPr:(NSInteger) pr
{
    MyClass *myClass = [[MyClass alloc]init];
    myClass.pr = pr;
    return myClass;
}
@end

int main(int argc, char *argv[])
{
    NSString __weak *b = nil;
    @autoreleasepool {
        NSString __weak *b = nil;
        {
            //NSString *c = [[NSString alloc] initWithFormat:@"Sample string: %d", 10];
            NSString *c = [NSString stringWithFormat:@"Sample string: %d", 10];
            b = c;
        }
        NSLog(@"B: %@", b);
    }
    NSLog(@"B: %@", b);
    
    ////////////////////////////////////////////////////////////////////////////////////    
    
    CFStringRef a = NULL;
    {
        NSString *d = [[NSString alloc]initWithFormat:@"Sample string: %d", 10];
        
        a = (__bridge_retained CFStringRef)d;
        //a = (__bridge CFStringRef)d;
    }
    NSLog(@"a: %@", a);
    CFRelease(a);
    
    ////////////////////////////////////////////////////////////////////////////////////
    
    @autoreleasepool {
        MyClass *obj = [[MyClass alloc] init];
        [obj setValue:@"Hello" forKey:@"prop"];
        NSLog(@"%@", [obj valueForKey:@"prop"]);
    
        NSArray *array =@[
            [MyClass myClassWithPr:10],
            [MyClass myClassWithPr:20],
            [MyClass myClassWithPr:20]];
        NSInteger sum = [[array valueForKeyPath:@"@sum.pr"]integerValue];
        NSLog(@"%d", sum);
    }
}
