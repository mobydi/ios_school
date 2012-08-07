//
//  MyClass.h
//  ios1_1
//
//  Created by ilya on 01.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject {
    //fields only
    @private float _myField;
}

//properies
@property (nonatomic, copy) NSString* myProperty;
@property (nonatomic, copy) NSString* myDynamicProp;

//Изменение дефолтных имен
//getter = (...), setter = (...))

//Только чтнение или запись
//readonly
//readwrite

//С ручным посчетом ссылок
//assign - просто чтение, простые типы такие как int
//copy - создает копию NSCopying
//retain  +1 счетчик ссылок

//С автоматическим подсчетом ссылок
//strong
//weak

//instans's methods
-(void) myMethodWithArg:(NSInteger)intArg andStringArg:(NSString *)stringArg;

//class's methods
+(void) myMethodWithArg2:(NSInteger)intArg andStringArg2:(NSString *)stringArg;

//constructor
-(id) init;

@end

////////////////////////////////MyProtocol//////////////////////////////////

@class MyUndefindedClass;

@protocol MyProtocol <NSObject>
-(void)myMethod;
@optional
-(void)myMethodOptional;
-(MyUndefindedClass*)myOptionalUndefindedMethod;
@end

@interface MyProtoClass : NSObject<MyProtocol>

@end

///////////////////////////////Hash категория///////////////////////////////////

@interface NSString (Hash)
-(NSString*) mh5Hash;
@end

