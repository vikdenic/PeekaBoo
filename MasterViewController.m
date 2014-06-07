//
//  MasterViewController.m
//  PeekaBoo
//
//  Created by Vik Denic on 6/5/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "MasterViewController.h"
#import "CustomCollectionViewCell.h"
#import "User.h"
#import "DetailViewController.h"

@interface MasterViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *homeCollectionView;
@property UICollectionViewFlowLayout *layout;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.fetchedResultsController.delegate = self;
    self.layout = (UICollectionViewFlowLayout *)[self.homeCollectionView collectionViewLayout];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self fetchRequestMethod];
}

- (void)fetchRequestMethod
{
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"User"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    [self.fetchedResultsController performFetch:nil];
    NSMutableArray *array = (NSMutableArray *)[self.fetchedResultsController fetchedObjects];
    if (array.count < 1)
    {
        [self setStockUsers];
    }
    [self.homeCollectionView reloadData];
}
- (void)setStockUsers
{
    int counter = 0;
    NSMutableArray *dataArray = [NSMutableArray array];
    NSArray *images = @[[UIImage imageNamed:@"brandon"],
                              [UIImage imageNamed:@"don.jpg"],
                              [UIImage imageNamed:@"max"],
                              [UIImage imageNamed:@"kevin"],
                              [UIImage imageNamed:@"thom"],
                              [UIImage imageNamed:@"aleshia"],
                              [UIImage imageNamed:@"ryan"]];
    for (UIImage *image in images)
    {
        NSData *data = UIImagePNGRepresentation(image);
        User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
        user.imgData = data;
        [dataArray addObject:user];
    }
    for (User *currentUser in dataArray)
    {
        if (counter == 0){
            currentUser.name = @"Brandon";
        }
        if (counter == 1){
            currentUser.name = @"Don";
        }
        if (counter == 2) {
            currentUser.name = @"Max";
        }
        if (counter == 3) {
            currentUser.name = @"Kevin";
        }
        if (counter == 4) {
            currentUser.name = @"Thom";
        }
        if (counter == 5) {
            currentUser.name = @"Aleshia";
        }
        if (counter == 6) {
            currentUser.name = @"Ryan";
        }
        currentUser.address = @"123 Mobile Makers";
        currentUser.phone = @"1800 Mobile Makers";
        currentUser.email = @"email@mobilemakers.com";
        counter ++;
    }
    [self fetchRequestMethod];
}
#pragma mark - Delegates

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.fetchedResultsController.sections[section] numberOfObjects];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    User *user = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.cellImageView.image = [UIImage imageWithData:user.imgData];
    cell.cellTitle.text = user.name;
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 150);
}


#pragma mark - Segue Methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailVC = segue.destinationViewController;
    detailVC.detailInstanceManagedObjectContext = self.managedObjectContext;
}
















@end
