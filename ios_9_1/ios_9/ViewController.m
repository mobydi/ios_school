//
//  ViewController.m
//  ios_9
//
//  Created by ilya on 29.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()
@property (retain, nonatomic) IBOutlet MyView *ourView;
@end

@implementation ViewController
@synthesize ourView;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setOurView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)tapOccured:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        [self.ourView setRandomColor];
    }
}

- (IBAction)panOccured:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint curr = [sender translationInView: self.ourView.superview];
        self.ourView.transform = CGAffineTransformMakeTranslation(curr.x, curr.y);;
        
    } else if(sender.state == UIGestureRecognizerStateEnded) {
        CGPoint curr = [sender translationInView: self.ourView.superview];
        self.ourView.transform = CGAffineTransformIdentity;
        self.ourView.center = CGPointMake(self.ourView.center.x + curr.x, self.ourView.center.y + curr.y);
        
    } else if (sender.state == UIGestureRecognizerStateCancelled){
        self.ourView.transform = CGAffineTransformIdentity;
        
    } else if (sender.state == UIGestureRecognizerStateFailed) {
        self.ourView.transform = CGAffineTransformIdentity;
        
    }
}
- (IBAction)pinchOccured:(UIPinchGestureRecognizer *)sender {
}

- (void)dealloc {
    [ourView release];
    [super dealloc];
}
@end
