//
//  MyClass.m
//  ios1_1
//
//  Created by ilya on 01.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass{
    //fields only
    float _myDefaultProtected;

    @protected
    float _myProtected;
    
    @private
    float _myPrivate;
    
    @public
    float _myPyblic;
    
    @package
    float _myPackage;
}

//properies
@synthesize myProperty = _myProperty;
//proreries wiht manuall getter and setter generator
@dynamic myDynamicProp;

//instan's method
-(void) myMethodWithArg:(NSInteger)intArg andStringArg:(NSString *)stringArg {
    [[self class] myMethodWithArg2:10 andStringArg2:@"Hello"];
    __unused NSString * a = self->_myProperty; //field
    __unused NSString * b = [self myProperty]; //property
    __unused NSString * d = [isa description]; //class isa    
    
    //id Pointer
    __unused id *myPoint = nil;
    
    //Class Type
    NSString* myObj = nil;
    if([myObj isKindOfClass:[NSString class]]){
        if ([myObj isMemberOfClass:[NSArray class]]){
        }
    }
    
    //Protocol
    __unused id<MyProtocol> *obj = nil;
    if([a conformsToProtocol:@protocol(MyProtocol)]){
        if ([a respondsToSelector:@selector(myMethodOptional)]){
        }
    }
    
    //Selector
    __unused SEL theSelector = @selector(myMethodWithArg:);
    __unused IMP theImplementation = [self methodForSelector:theSelector];
    theImplementation(self, theSelector);
    
    //Dynamic type
    __unused SEL theSelectorFromString = NSSelectorFromString(@"myMethodWithArg");
    __unused id dynClass = NSClassFromString(@"NSString");
    
    //Category
    __unused NSString *stringWithCategory = [a mh5Hash];
    
    //NSFastEnumeration
    __unused NSArray *array = nil;
    for (NSString *s in array) {
        NSLog(@"NSString");
    }
    
    //Exceptions
    @try {
        @throw [[NSException alloc] init];
    }
    @catch (NSException *exception) {
        NSLog(@"NSException");
    }
    @finally {
        
    }
    
    //NSError
    NSError *error = nil;
    theImplementation(self, theSelector, &error);
    if (error){
    }
}

//class's constructor
-(id) init {
    self = [super init];
    if (self) {
        //Do smth in constructor
    }
    return self;
}

//class's method
+(void) myMethodWithArg2:(NSInteger)intArg andStringArg2:(NSString *)stringArg {
}

//private instans's method
-(void) myMethodWithArg:(NSInteger)a{
}

//private instans's method
-(void) myMethodWithoutArg{
}

//setter for myProperty
-(void)setMyProperty:(NSString *)myProperty{
    self->_myField = [myProperty floatValue];
}

//getter for myProperty
-(NSString *)myProperty{
    return nil;
}

-(void)dealloc{
    [_myProperty release];
    self.myProperty = nil;
    [super dealloc];
}

@end
