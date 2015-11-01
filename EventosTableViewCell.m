//
//  EventosTableViewCell.m
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 12/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "EventosTableViewCell.h"

@implementation EventosTableViewCell
@synthesize imagen;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
   
    self.imagen.layer.cornerRadius=10.0f;
    self.imagen.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
       // Configure the view for the selected state
}

@end
