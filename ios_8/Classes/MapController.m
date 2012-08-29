//
//  MapController.m
//  Locations
//
//  Created by Yuriy Buyanov on 8/25/12.
//
//

#import "MapController.h"
#import "Event.h"

@interface MapController ()<MKMapViewDelegate>

@property (retain, nonatomic) NSArray* events;
@property (retain, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapController
@synthesize mapView=_mapView;
@synthesize events=_events;

- (id)initWithEvents:(NSArray*)events;
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.events = events;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_mapView addAnnotations: _events];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    _mapView.delegate = nil;
    [_mapView release];
    [_events release];
    [super dealloc];
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString* identifier = @"Event";
    if ([annotation isKindOfClass:[Event class]]) {
        MKAnnotationView* view = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (!view) {
            view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        }
        view.canShowCallout = YES;
        return view;
    } else {
        return nil;
    }
    
}

@end
