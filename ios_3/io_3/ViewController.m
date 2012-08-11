//
//  ViewController.m
//  io_3
//
//  Created by ilya on 08.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
}

@property (strong, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) IBOutlet UILabel *lbl;
- (IBAction)btn:(UIButton *)sender ;

@end

@implementation ViewController
@synthesize btn;
@synthesize lbl;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(barButtonItemTap:)];
}

-(void)barButtonItemTap{
    NSLog(@"barButtonItemTap");
}

- (IBAction)btn:(UIButton *)sender {
    UIViewController *newCtrl = [[UINavigationController alloc] init]; //[[UIViewController alloc] init];
    self.title = @"Hello";
    [self.navigationController pushViewController:newCtrl animated:YES];
}

- (void)viewDidUnload
{
    [self setBtn:nil];
    [self setLbl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
