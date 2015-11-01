//
//  EventosTableViewController.m
//  FiestasSAG
//
//  Created by Dani Gonzalez castillo on 12/08/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "EventosTableViewController.h"
#import "EventosTableViewCell.h"
#import "ViewController.h"

@interface EventosTableViewController ()
{
    NSArray *Titulo;
    NSArray *Subtitulo1;
    NSArray *Subtitulo2;
    NSArray *temporal;
    NSArray *botones;
    PFQuery *retrieveColors;
    NSString *clase;
   
    
}

@end

@implementation EventosTableViewController
@synthesize tableview,UNO,DOS,tres,cuatro4,cinco5,seis,siete,ocho,nueve,diez,once,doce,trece,catorce,quince,dieciseis,diecisiete,dieciocho,diecinueve,veinte,veintiuno,vientidos,ventitres,venticuatro,venticinco,ventiseis,ventisiete,ventiocho,ventinueve,treinta,labelfecha;


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
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"%@", strDate);
    
   [super viewDidLoad];
    clase = [NSString stringWithFormat:@"D%@",strDate];
    [self performSelector:@selector(retrieveFromParse)];
 

       


    botones=[NSArray arrayWithObjects:DOS,UNO,tres,cuatro4,cinco5,seis,siete,ocho,nueve,diez,once,doce,trece,catorce,quince,dieciseis,diecisiete,dieciocho,diecinueve,veinte,veintiuno,vientidos,ventitres,venticuatro,venticinco,ventiseis,ventisiete,ventiocho,ventinueve,treinta,nil];
    
    
    temporal=[[NSArray alloc]initWithArray:Titulo];
 [botones[[strDate intValue]-1] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  [botones[[strDate intValue]-1] setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    CALayer *layer = [botones[[strDate intValue]-1] layer];
    [layer setCornerRadius:15];
    [botones[[strDate intValue]-1] setBackgroundColor:[UIColor colorWithRed:295.0/255.0 green:195.0/255.0 blue:80.0/255.0 alpha:0.63]];
    
    
   
    
}
- (void) retrieveFromParse {
    
    retrieveColors = [PFQuery queryWithClassName:[NSString stringWithFormat:@"%@",clase]];
      clase = @"D2";
    
    [retrieveColors orderByAscending:@"hora"];
    
    [retrieveColors findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            FechaArray = [[NSArray alloc] initWithArray:objects];
            HoraArray = [[NSArray alloc] initWithArray:objects];
            DescripcionArray = [[NSArray alloc] initWithArray:objects];
            FotoArray = [[NSArray alloc] initWithArray:objects];
            
            
        }
        
        [tableview reloadData];
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


- (IBAction)uno:(id)sender {
    
    clase = @"D2";
     [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[0] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[0]setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];

    }
}

- (IBAction)Dos:(id)sender {
   
     clase = @"D1";
     [self performSelector:@selector(retrieveFromParse)];
  
    [tableview reloadData];
    for (int i=0; i<botones.count; i++) {
        
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [botones[1] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[1] setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
}
- (IBAction)tres:(id)sender {
  
    clase = @"D3";
    [self performSelector:@selector(retrieveFromParse)];

    
    [tableview reloadData];
    for (int i=0; i<botones.count; i++) {
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [tres setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [tres.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }

}
- (IBAction)cuatro:(id)sender {
    
    clase = @"D4";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    
    for (int i=0; i<botones.count; i++) {
       [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cuatro4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cuatro4.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }

}
- (IBAction)cinco:(id)sender {
    
    clase = @"D5";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cinco5 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cinco5.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    

}
- (IBAction)seis:(id)sender {
    
    clase = @"D6";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [seis setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [seis.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)siete:(id)sender {
    
    clase = @"D7";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [siete setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [siete.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}

- (IBAction)ocho:(id)sender {
    
    clase = @"D8";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [ocho setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [ocho.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)nueve:(id)sender {
    
    clase = @"D9";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [nueve setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [nueve.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)diez:(id)sender {
    
    clase = @"D10";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [diez setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [diez.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)once:(id)sender {
    
    clase = @"D11";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [once setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [once.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)doce:(id)sender {
    
    clase = @"D12";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [doce setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [doce.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)trece:(id)sender {
    
    clase = @"D13";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [trece setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [trece.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)catorce:(id)sender {
    
    clase = @"D14";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [catorce setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [catorce.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)quince:(id)sender {
    
    clase = @"D15";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [quince setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [quince.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}

- (IBAction)dieciseis:(id)sender {
    
    clase = @"D16";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [dieciseis setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [dieciseis.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)diecisiete:(id)sender {
    
    clase = @"D17";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [diecisiete setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [diecisiete.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)dieciocho:(id)sender {
    
    clase = @"D18";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [dieciocho setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [dieciocho.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)diecinueve:(id)sender {
    
    clase = @"D19";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [diecinueve setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [diecinueve.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)veinte:(id)sender {
    
    clase = @"D20";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [veinte setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [veinte.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)veintiuno:(id)sender {
    
    clase = @"D21";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [veintiuno setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [veintiuno.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)veintidos:(id)sender {
    
    clase = @"D22";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [vientidos setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [vientidos.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)veintitres:(id)sender {
    
    clase = @"D23";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [ventitres setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [ventitres.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)veinticuatro:(id)sender {
    
    clase = @"D24";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    ;
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [venticuatro setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [venticuatro.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)veinticinco:(id)sender {
    
    clase = @"D25";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [venticinco setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [venticinco.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)ventiseis:(id)sender {
    
    clase = @"D26";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [ventiseis setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [ventiseis.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)veintisiete:(id)sender {
    
    clase = @"D27";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [ventisiete setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [ventisiete.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)ventiocho:(id)sender {
    
    clase = @"D28";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [ventiocho setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [ventiocho.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)veintinueve:(id)sender {
    
    clase = @"D29";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [ventinueve setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [ventinueve.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
}
- (IBAction)treinta:(id)sender {
    
    clase = @"D30";
    [self performSelector:@selector(retrieveFromParse)];
    [tableview reloadData];
    
    for (int i=0; i<botones.count; i++) {
        [botones[i] setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        [botones[i] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [treinta setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [treinta.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
    }
    
    
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



















@end
