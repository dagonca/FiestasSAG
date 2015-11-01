//
//  FotosCell.h
//  TUD
//
//  Created by Dani Gonzalez castillo on 13/05/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FotosCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *parseImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingSpinner;

@end
