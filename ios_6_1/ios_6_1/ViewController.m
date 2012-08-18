//
//  ViewController.m
//  ios_6_1
//
//  Created by ilya on 18.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self performSelectorOnMainThread:@selector(setText:) withObject:@"Hello" waitUntilDone:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
