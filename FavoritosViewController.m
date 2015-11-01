//
//  FavoritosViewController.m
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 16/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "FavoritosViewController.h"
#import "EventosTableViewCell.h"
#import "AppDelegate.h"
#import "ViewController.h"
@interface FavoritosViewController ()
@end

@implementation FavoritosViewController
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
    

    
    // Do any additional setup after loading the view.
     AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
    
    if (appDelegate.globalArray.count == 0  || appDelegate.globalArray1.count == 0  || appDelegate.globalArray2.count == 0 || appDelegate.globalArray3.count == 0 ) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"No hay favoritos"
                                                       message: @"Aun no has añadido favoritos"
                                                      delegate: self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK",nil];
        
        
        [alert show];
        
           }
    
        
    
    [appDelegate.globalArray2 sortUsingSelector:@selector(compare:)];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];


    return [appDelegate.globalArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    EventosTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!Cell) {
        Cell = [[EventosTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    Cell.evento.text = [appDelegate.globalArray objectAtIndex:indexPath.row];
    Cell.hora.text= [appDelegate.globalArray1 objectAtIndex:indexPath.row];
    Cell.fecha.text= [appDelegate.globalArray2 objectAtIndex:indexPath.row];

    NSData *imageData = [appDelegate.globalArray3 objectAtIndex:indexPath.row];
    
    Cell.imagen.image = [UIImage imageWithData:imageData];
    
    
    
       return Cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    [appDelegate.globalArray removeObjectAtIndex:indexPath.row];
    [appDelegate.globalArray1 removeObjectAtIndex:indexPath.row];
    [appDelegate.globalArray2 removeObjectAtIndex:indexPath.row];
    [appDelegate.globalArray3 removeObjectAtIndex:indexPath.row];
    
    NSLog(@"0 = %@",appDelegate.globalArray);
    NSLog(@" 1 = %@",appDelegate.globalArray1);
    NSLog(@"2= %@",appDelegate.globalArray2);

    [tableView reloadData];
    
    
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Eliminar";
}



- (IBAction)refresh:(id)sender {
    
    [tableView reloadData];
   
    
    


   

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Info"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ViewController *destViewController = segue.destinationViewController;
       
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
       
        destViewController.recipeName = [appDelegate.globalArray objectAtIndex:indexPath.row];
        
        
        destViewController.recipeName2 = [appDelegate.globalArray1 objectAtIndex:indexPath.row];

        
       
        destViewController.recipeName3 = [appDelegate.globalArray2 objectAtIndex:indexPath.row];
        
        
     
        NSData *imageData = [appDelegate.globalArray3 objectAtIndex:indexPath.row];
        UIImage *image = [UIImage imageWithData:imageData];
        
        destViewController.Foto = image;
        
    }
}

@end
