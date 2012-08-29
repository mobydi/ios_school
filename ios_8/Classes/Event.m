//
//  Event.m
//  Locations
//
//  Created by Yuriy Buyanov on 8/25/12.
//
//

#import "Event.h"
#import "User.h"


@implementation Event

@dynamic latitude;
@dynamic longitude;
@dynamic creationDate;
@dynamic user;

#pragma mark -
#pragma mark MKAnnotation

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

- (NSString *)title {
    return [[NSDate dateWithTimeIntervalSinceReferenceDate:self.creationDate] description];
}

- (NSString*)subtitle {
    return self.user.name;
}

@end
