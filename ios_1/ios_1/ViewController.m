//
//  ViewController.m
//  ios_1
//
//  Created by ilya on 01.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
@private NSString* _str;
}
@property (retain, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController
@synthesize myLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMyLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonTapped:(UIButton *)sender {
    NSLog(@"Button tapped");
    [_str release];
    _str = [[NSString alloc] init];
    //myLabel.text = @"Hello world";
    
    [NSAutoreleasePool]
}

- (IBAction)buttonTapped2:(UIButton *)sender {
    myLabel.text = _str;
}



- (void)dealloc {
    [myLabel release];
    [super dealloc];
    [_str release];
}
@end
