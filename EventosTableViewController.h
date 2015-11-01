//
//  EventosTableViewController.h
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 12/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>



@interface EventosTableViewController : UITableViewController{
    
    NSArray *FechaArray;
    NSArray *HoraArray;
    NSArray *DescripcionArray;
    NSArray *FotoArray;
    
}


- (IBAction)uno:(id)sender;
- (IBAction)Dos:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *labelfecha;

@property (strong, nonatomic) IBOutlet UITableView *tableview;


@property (weak, nonatomic) IBOutlet UIButton *UNO;
@property (weak, nonatomic) IBOutlet UIButton *DOS;
@property (weak, nonatomic) IBOutlet UIButton *tres;
@property (weak, nonatomic) IBOutlet UIButton *cuatro4;
@property (weak, nonatomic) IBOutlet UIButton *cinco5;
@property (weak, nonatomic) IBOutlet UIButton *seis;
@property (weak, nonatomic) IBOutlet UIButton *siete;
@property (weak, nonatomic) IBOutlet UIButton *ocho;
@property (weak, nonatomic) IBOutlet UIButton *nueve;
@property (weak, nonatomic) IBOutlet UIButton *diez;
@property (weak, nonatomic) IBOutlet UIButton *once;
@property (weak, nonatomic) IBOutlet UIButton *doce;
@property (weak, nonatomic) IBOutlet UIButton *trece;
@property (weak, nonatomic) IBOutlet UIButton *catorce;
@property (weak, nonatomic) IBOutlet UIButton *quince;
@property (weak, nonatomic) IBOutlet UIButton *dieciseis;
@property (weak, nonatomic) IBOutlet UIButton *diecisiete;
@property (weak, nonatomic) IBOutlet UIButton *dieciocho;
@property (weak, nonatomic) IBOutlet UIButton *diecinueve;
@property (weak, nonatomic) IBOutlet UIButton *veinte;
@property (weak, nonatomic) IBOutlet UIButton *veintiuno;
@property (weak, nonatomic) IBOutlet UIButton *vientidos;
@property (weak, nonatomic) IBOutlet UIButton *ventitres;
@property (weak, nonatomic) IBOutlet UIButton *venticuatro;
@property (weak, nonatomic) IBOutlet UIButton *venticinco;
@property (weak, nonatomic) IBOutlet UIButton *ventiseis;
@property (weak, nonatomic) IBOutlet UIButton *ventisiete;
@property (weak, nonatomic) IBOutlet UIButton *ventiocho;
@property (weak, nonatomic) IBOutlet UIButton *ventinueve;
@property (weak, nonatomic) IBOutlet UIButton *treinta;


@end
