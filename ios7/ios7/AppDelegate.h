//
//  AppDelegate.h
//  ios7
//
//  Created by ilya on 22.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainTableViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainTableViewController *viewController;

@end
