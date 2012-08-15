//
//  MyCustomCell.m
//  io_3
//
//  Created by ilya on 11.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "MyCustomCell.h"
@interface MyCustomCell()

@end

@implementation MyCustomCell
@synthesize label;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
