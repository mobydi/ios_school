//
//  Event.h
//  Locations
//
//  Created by ilya on 25.08.12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) User *user;

@end
