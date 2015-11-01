//
//  TorosViewController.m
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 14/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "TorosViewController.h"
#import "EventosTableViewCell.h"
#import "ViewController.h"

@interface TorosViewController ()

@end

@implementation TorosViewController
@synthesize tableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(retrieveFromParse)];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) retrieveFromParse {
    
    PFQuery *retrieveColors = [PFQuery queryWithClassName:@"Toros"];
    
    [retrieveColors orderByAscending:@"posicion"];
    
    [retrieveColors findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            FechaArray = [[NSArray alloc] initWithArray:objects];
            HoraArray = [[NSArray alloc] initWithArray:objects];
            DescripcionArray = [[NSArray alloc] initWithArray:objects];
            FotoArray = [[NSArray alloc] initWithArray:objects];
            
            
        }
        
        [tableView reloadData];
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return DescripcionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    EventosTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!Cell) {
        Cell = [[EventosTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    PFObject *tempObjec = [DescripcionArray objectAtIndex:indexPath.row];
    PFObject *tempObject = [HoraArray objectAtIndex:indexPath.row];
    PFObject *FotoObject = [FechaArray objectAtIndex:indexPath.row];
    
    Cell.evento.text =  [tempObjec objectForKey:@"evento"];
    
    Cell.hora.text= [tempObject objectForKey:@"hora"];
    Cell.fecha.text= [FotoObject objectForKey:@"fecha"];
    
    PFObject *FotoObjec = [FotoArray objectAtIndex:indexPath.row];
    
    PFFile *foto = [FotoObjec objectForKey:@"imagen"];
    
    
    
    [foto getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
        if(!error){
            Cell.imagen.image = [UIImage imageWithData:data];
        }
        
    }];
    
    
    
    return Cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Info"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ViewController *destViewController = segue.destinationViewController;
        
        PFObject *tempObjec = [DescripcionArray objectAtIndex:indexPath.row];
        destViewController.recipeName = [tempObjec objectForKey:@"evento"];
        
        PFObject *tempObject = [HoraArray objectAtIndex:indexPath.row];
        destViewController.recipeName2 = [tempObject objectForKey:@"hora"];
        
        PFObject *tempObject2 = [FechaArray objectAtIndex:indexPath.row];
        destViewController.recipeName3 = [tempObject2 objectForKey:@"fecha"];
        
        
        PFObject *FotoObjec = [FotoArray objectAtIndex:indexPath.row];
        PFFile *foto = [FotoObjec objectForKey:@"imagen"];
        NSData *imageData = [foto getData];
        UIImage *image = [UIImage imageWithData:imageData];
        
        destViewController.Foto = image;
    }
    
}


- (IBAction)atras:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
