//
//  ViewController.m
//  ios_6_1
//
//  Created by ilya on 18.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *bttn;
- (IBAction)bttnPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *label;
@end

@implementation ViewController{
@private
    NSOperationQueue *queue;
}
@synthesize bttn;
@synthesize label;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    queue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation *block = [NSBlockOperation blockOperationWithBlock:^{
        @autoreleasepool {
            NSDate *date = [NSDate date];
            NSTimeInterval dateInSeconds = [date timeIntervalSinceReferenceDate];
            while (fabs(dateInSeconds - [[NSDate date] timeIntervalSinceReferenceDate]) < 5) {
                ;
            }
        }
        
        if ([NSOperationQueue mainQueue] == [NSOperationQueue currentQueue]){
        }
        
        [self performSelectorOnMainThread:@selector(setText:) withObject:@"Hello" waitUntilDone:NO];
    }];
    
    NSBlockOperation *blockLabel = [NSBlockOperation blockOperationWithBlock:^{
        //if([blockLabel isCancelled]) {}
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self setText:@"Hello label"];
        }];
    }];
    
    NSInvocationOperation *invoke = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(setText:) object:@"Hello2"];
    
    //priorities
    [block setQueuePriority:NSOperationQueuePriorityNormal];
    [queue setMaxConcurrentOperationCount:5];
    
    //addDependency
    [blockLabel addDependency:block];
    [invoke addDependency:blockLabel];
    
    
    //queue
    [queue addOperation:block];
    [queue addOperation:blockLabel];
    [queue addOperation:invoke];

    
    [self GCD];
}

-(void)GCD
{
    /*
     очереди:
        *HIGH
        *DEFAULT
        *LOD
    
    __block id a= self;
    b = ^int(NSString *str, int b1){
        a->setText();
        return 10;
    }
    */
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        @autoreleasepool {
            NSDate *date = [NSDate date];
            NSTimeInterval dateInSeconds = [date timeIntervalSinceReferenceDate];
            while (fabs(dateInSeconds - [[NSDate date] timeIntervalSinceReferenceDate]) < 5) {
                ;
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setText:@"GCD"];
        });
    });
   
    dispatch_group_t g1 = dispatch_group_create();
    dispatch_group_async(g1, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @autoreleasepool {
            NSDate *date = [NSDate date];
            NSTimeInterval dateInSeconds = [date timeIntervalSinceReferenceDate];
            while (fabs(dateInSeconds - [[NSDate date] timeIntervalSinceReferenceDate]) < 5) {
                ;
            }
        }
    });
    
    dispatch_group_notify(g1, dispatch_get_main_queue(), ^{
        [self setText:@"GCD_group"];
    });
    
    dispatch_release(g1);
}

-(void)setText:(id)object
{
    [label setText:object];
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [self setBttn:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)bttnPressed:(id)sender {
    [queue cancelAllOperations];
    [self setText:@"canceled"];
}
@end
