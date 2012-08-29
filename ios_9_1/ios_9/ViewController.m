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

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self resignFirstResponder];
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    static int numberOfTime =0;
    
    if(motion == UIEventSubtypeMotionShake) {
        self.view.backgroundColor = (numberOfTime & 1) ? [UIColor redColor] : [UIColor blueColor];
        numberOfTime++;
    }
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
    if (sender.state == UIGestureRecognizerStateChanged) {
        CGFloat scale = sender.scale;
        self.ourView.transform = CGAffineTransformMakeScale(scale, scale);
        
    } else if (sender.state == UIGestureRecognizerStateEnded){
        CGFloat scale = sender.scale;
        CGPoint center = sender.view.center;
        CGRect newFrame = CGRectMake(0.0f, 0.0f, sender.view.bounds.size.width * scale, sender.view.bounds.size.height *scale);
        self.ourView.transform = CGAffineTransformIdentity;
        self.ourView.frame = newFrame;
        self.ourView.center = center;
        
    } else if (sender.state == UIGestureRecognizerStateFailed || sender.state == UIGestureRecognizerStateCancelled) {
        self.view.transform =CGAffineTransformIdentity;
    }
}

- (void)dealloc {
    [ourView release];
    [super dealloc];
}
@end
