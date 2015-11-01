//
//  ReligionViewController.h
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 13/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ReligionViewController : UIViewController{
    
    NSArray *FechaArray;
    NSArray *HoraArray;
    NSArray *DescripcionArray;
    NSArray *FotoArray;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
