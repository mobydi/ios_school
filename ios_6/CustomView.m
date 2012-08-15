//
//  CustomView.m
//  ios_6
//
//  Created by ilya on 15.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "CustomView.h"
#import <QuartzCore/QuartzCore.h>

#define USE_LAYERS TRUE

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#if USE_LAYERS

-(void)layoutSubviews
{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.name = @"my layer";
    layer.frame = self.bounds;
    layer.colors = [NSArray arrayWithObjects:
                    (id)[UIColor blueColor].CGColor, (id)[UIColor redColor].CGColor, nil];
    //layer.startPoint = CGPointMake(0.0, 0.5);
    //layer.endPoint = CGPointMake(1.0, 0.5);
    layer.cornerRadius = 10.0f;
    
    [self.layer insertSublayer:layer atIndex:0];
}

#else

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    //CGRect aRect = { .origin = { .x = 10, .y = 20 }, .size = {100, 100}};
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10];
    [[UIColor redColor] setStroke];
    
    [path stroke];
    [path addClip];
    
    CGColorSpaceRef colorSpace = NULL;
    CGFloat location[] = { 0.0f, 1.0f };
    
    CFArrayRef color = (CFArrayRef)[[NSArray alloc]initWithObjects:(id)[UIColor blueColor].CGColor, (id)[UIColor redColor].CGColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace = CGColorSpaceCreateDeviceRGB(),
        (CFArrayRef)@[(id)[UIColor blueColor].CGColor, (id)[UIColor redColor].CGColor], location);
    
    CGContextDrawLinearGradient(context, gradient,
        CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMinY(self.bounds)),
        CGPointMake(CGRectGetMidX(self.bounds), CGRectGetHeight(self.bounds)), 0);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CFRelease(color);
    
    CGContextRestoreGState(context);
}

#endif


@end
