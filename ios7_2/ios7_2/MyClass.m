//
//  MyClass.m
//  ios7_2
//
//  Created by ilya on 22.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "MyClass.h"
#import <objc/objc-runtime.h>

@implementation MyClass

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [self init];
    self.myString = [aDecoder decodeObjectForKey:@"MyString"];
    self.myInteger = [aDecoder decodeIntegerForKey:@"MyInteger"];
    self.myBoolean = [aDecoder decodeBoolForKey:@"MyBoolean"];
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.myString forKey:@"MyString"];
    [aCoder encodeInteger:self.myInteger forKey:@"MyInteger"];
    [aCoder encodeBool:self.myBoolean forKey:@"MyBoolean"];
}

@end
