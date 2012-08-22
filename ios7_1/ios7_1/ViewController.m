//
//  ViewController.m
//  ios7_1
//
//  Created by ilya on 22.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()<NSURLConnectionDelegate, NSURLConnectionDataDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, strong) UIView *activity;
@property (strong, strong) NSMutableData *networkData;
@end

@implementation ViewController
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self startActivityIndicator];
    NSURL *url = [NSURL URLWithString:@"http://i.imm.io/BzH7.jpeg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [connection start];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response    {
    NSHTTPURLResponse *http = (NSHTTPURLResponse *)response;
    if (http.statusCode / 100 == 2) {
        NSLog(@"Success");
    } else{
        
    }
    self.networkData = [NSMutableData data];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.networkData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    self.imageView.image =[UIImage imageWithData:self.networkData];
    self.networkData =nil;
    
    [self stopActivityIndicator];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
    self.networkData = nil;
}


-(void)stopActivityIndicator{
    [self.activity removeFromSuperview];
    self.activity = nil;
    self.view.userInteractionEnabled = YES;
    
}

-(void) startActivityIndicator
{
    [self stopActivityIndicator];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 120.0f, 120.0f)];
    view.layer.cornerRadius = 8.0f;
    CGRect appFrame = [UIScreen mainScreen ].applicationFrame;
    view.center = CGPointMake(CGRectGetMidX(appFrame), CGRectGetMidY(appFrame ));
    view.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.8f];
    view.exclusiveTouch = YES;
    
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.frame = CGRectMake(0.0f, 0.0f, 40.0f, 40.0f);
    indicator.center = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
    indicator.hidesWhenStopped = YES;
    [indicator startAnimating];
    
    [view addSubview:indicator];
    [self.view addSubview:view];
    
    self.activity = view;
    self.view.userInteractionEnabled = NO;
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
