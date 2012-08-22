//
//  ViewController.m
//  ios7_2
//
//  Created by ilya on 22.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "ViewController.h"
#import "MyClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)buttonPresed:(id)sender {
    
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"ourPlist" withExtension:@"plist"];
    NSURL *docURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    NSURL *destinationUrl = [docURL URLByAppendingPathComponent:@"ourPlist.plist" isDirectory: NO];
    
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtURL:destinationUrl error:&error];
    if([[NSFileManager defaultManager] copyItemAtURL:fileURL toURL:destinationUrl error:&error]){
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfURL:destinationUrl];
        NSLog(@"Dict: %@", dict);
        
        MyClass *myClass = [[MyClass alloc] init];
        myClass.myString = [dict objectForKey:@"MyString"];
        myClass.myInteger = [[dict objectForKey:@"MyInteger"]integerValue];
        myClass.myBoolean = [[dict objectForKey:@"MyBoolean"] boolValue];
        
        NSMutableData *encodedData = [NSMutableData data];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:encodedData];
        [archiver setOutputFormat:NSPropertyListXMLFormat_v1_0];
        [archiver encodeRootObject:myClass];
        [archiver finishEncoding];
        [encodedData writeToURL:[docURL URLByAppendingPathComponent:@"MyNewFile.archive"] atomically:YES];
     } 
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
