//
//  FotosViewController.h
//  TUD
//
//  Created by Dani Gonzalez castillo on 13/05/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FotosCell.h"
#import <Parse/Parse.h>


@interface FotosViewController : UIViewController{
    
    NSArray *imageFilesArray;
    
    
    
}

@property (weak, nonatomic) IBOutlet UICollectionView *imagesCollection;



@end
