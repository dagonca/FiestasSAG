//
//  ViewController.m
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 12/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
@end

@implementation ViewController{
    int j;
}
@synthesize recipeFoto,Foto,recipeLabel,recipeLabel2,recipeLabel3,recipeName,recipeName2,recipeName3,imageView,label,recipeName4,addButton,ImgFav;

-(void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    recipeLabel.text = recipeName;
    recipeLabel2.text = recipeName2;
    recipeLabel3.text = recipeName3;
   

    imageView.image = Foto;

    self.imageView.layer.cornerRadius=10.0f;
    self.imageView.clipsToBounds = YES;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    
    
    for (int i =0; i<appDelegate.globalArray.count; i++) {
        if ([recipeName isEqualToString:[NSString stringWithFormat:@"%@",appDelegate.globalArray[i]]]) {
            
            ImgFav.hidden=NO;
             NSLog(@"fav");
            
            
        }
                }
    

    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



- (IBAction)back:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}



-(IBAction)save:(id)sender{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    for (int i =0; i<appDelegate.globalArray.count; i++) {
        if ([recipeName isEqualToString:[NSString stringWithFormat:@"%@",appDelegate.globalArray[i]]]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Evento Repetido"
                                                           message: @"Este evento ya esta en favoritos"
                                                          delegate: self
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:@"OK",nil];
            
            
            [alert show];
            j=1;
            
             NSLog(@"FAV");
           
   
        }
    }
  
    if (j!=1) {
    [appDelegate.globalArray addObject:[NSString stringWithFormat:@"%@",recipeName]];
    [appDelegate.globalArray1 addObject:[NSString stringWithFormat:@"%@",recipeName2]];
    [appDelegate.globalArray2 addObject:[NSString stringWithFormat:@"%@",recipeName3]];
    [appDelegate.globalArray3 addObject:UIImagePNGRepresentation(Foto)];
        NSLog(@"NO FAV");
        ImgFav.hidden=NO;

    }
            
   
    
   

    }
@end
