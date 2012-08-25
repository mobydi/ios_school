//
//  MyClass.h
//  ios7_2
//
//  Created by ilya on 22.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject<NSCoding>
@property (nonatomic, copy) NSString *myString;
@property (nonatomic, assign) BOOL myBoolean;
@property (nonatomic, assign) NSInteger myInteger;
@end
