//
//  EventosTableViewCell.h
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 12/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventosTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *evento;
@property (weak, nonatomic) IBOutlet UILabel *hora;
@property (weak, nonatomic) IBOutlet UILabel *fecha;

@property (weak, nonatomic) IBOutlet UIImageView *imagen;
@end
