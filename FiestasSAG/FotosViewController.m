//
//  FotosViewController.m
//  TUD
//
//  Created by Dani Gonzalez castillo on 13/05/14.
//  Copyright (c) 2014 Dani Gonzalez castillo. All rights reserved.
//

#import "FotosViewController.h"

#import "FotosCell.h"

@interface FotosViewController ()

@end

@implementation FotosViewController
@synthesize imagesCollection;

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
    [self queryParseMethod];
}
- (void)queryParseMethod {
    NSLog(@"start query");
    PFQuery *query = [PFQuery queryWithClassName:@"Colaboradores"];
    
    [query orderByAscending:@"posicion"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            imageFilesArray = [[NSArray alloc] initWithArray:objects];
            
            

            
            [imagesCollection reloadData];
        }
    }];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
     return [imageFilesArray count];}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"imageCell";
    FotosCell *cell = (FotosCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    PFObject *imageObject = [imageFilesArray objectAtIndex:indexPath.row];
    PFFile *imageFile = [imageObject objectForKey:@"foto"];
    
    
    
    cell.loadingSpinner.hidden = NO;
    [cell.loadingSpinner startAnimating];
    
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            cell.parseImage.image = [UIImage imageWithData:data];
            [cell.loadingSpinner stopAnimating];
            cell.loadingSpinner.hidden = YES;
            
            
       
            
        }
    }];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
