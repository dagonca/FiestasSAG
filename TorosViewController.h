//
//  TorosViewController.h
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 14/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface TorosViewController : UIViewController{
    
    NSArray *FechaArray;
    NSArray *HoraArray;
    NSArray *DescripcionArray;
    NSArray *FotoArray;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
