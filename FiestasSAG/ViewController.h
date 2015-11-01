//
//  ViewController.h
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 12/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
 
}


- (IBAction)back:(id)sender;


@property (nonatomic, strong) NSString *recipeName;

@property (weak, nonatomic) IBOutlet UITextView *recipeLabel;

@property (nonatomic, strong) NSString *recipeName2;


@property (weak, nonatomic) IBOutlet UILabel *recipeLabel2;

@property (nonatomic, strong) NSString *recipeName3;

@property (weak, nonatomic) IBOutlet UILabel *recipeLabel3;


@property (weak, nonatomic) IBOutlet UIImageView *recipeFoto;

@property (nonatomic, strong) UIImage *Foto;


@property (weak, nonatomic) IBOutlet UILabel *label;


@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, strong) NSString *recipeName4;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIImageView *ImgFav;

@end
