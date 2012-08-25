//
//  User.h
//  Locations
//
//  Created by ilya on 25.08.12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Event *events;

@end
