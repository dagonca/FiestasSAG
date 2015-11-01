//
//  CategoriasTableViewController.m
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 16/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "CategoriasTableViewController.h"

@interface CategoriasTableViewController ()

@end

@implementation CategoriasTableViewController
@synthesize cultura,Religion,deportes,toros,mudica;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.Religion.layer.cornerRadius=10.0f;
    self.Religion.clipsToBounds = YES;

    
    self.deportes.layer.cornerRadius=10.0f;
    self.deportes.clipsToBounds = YES;

    
    self.mudica.layer.cornerRadius=10.0f;
    self.mudica.clipsToBounds = YES;

    
    self.toros.layer.cornerRadius=10.0f;
    self.toros.clipsToBounds = YES;

    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
