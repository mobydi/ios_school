//
//  MyView.m
//  ios_9
//
//  Created by ilya on 29.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setRandomColor
{
    NSInteger red = rand() % 255;
    NSInteger green = rand() % 255;
    NSInteger blue = rand() % 255;
    
    self.backgroundColor = [UIColor colorWithRed:
                            red/255.0f green:green/255.0f blue:blue/255.0f
                            alpha:1.0f];
}

@end
