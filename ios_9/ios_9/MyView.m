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
    
    self.backgroundColor = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if(touch.tapCount == 2) {
        [self setRandomColor];
    } else if (touch.tapCount == 1) {
        CGPoint curr = [touch locationInView:self.superview];
        CGPoint prev = [touch previousLocationInView:self.superview];
        CGFloat dX = curr.x - prev.x;
        CGFloat dY = curr.y - prev.y;
        
        self.center = CGPointMake(self.center.x + dX, self.center.y + dY);
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if(touch.tapCount == 1){
        CGPoint curr = [touch locationInView:self.superview];
        CGPoint prev = [touch previousLocationInView:self.superview];
        CGFloat dX = curr.x - prev.x;
        CGFloat dY = curr.y - prev.y;
        
        CGAffineTransform transform = self.transform;
        transform = CGAffineTransformTranslate(transform, dX, dY);
        self.transform = transform;
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if(touch.tapCount == 1){
        self.transform = CGAffineTransformIdentity;
    }
}

@end
