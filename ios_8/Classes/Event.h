//
//  Event.h
//  Locations
//
//  Created by Yuriy Buyanov on 8/25/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@class User;

@interface Event : NSManagedObject<MKAnnotation>

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) NSTimeInterval creationDate;
@property (nonatomic, retain) User *user;

@end
