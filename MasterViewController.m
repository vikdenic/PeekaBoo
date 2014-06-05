//
//  MasterViewController.m
//  PeekaBoo
//
//  Created by Vik Denic on 6/5/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "MasterViewController.h"
#import "CustomCollectionViewCell.h"

@interface MasterViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *homeCollectionView;
@property (strong, nonatomic) NSArray *stockPhotosArray;
@property UICollectionViewFlowLayout *layout;

@end

@implementation MasterViewController

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
    self.layout = (UICollectionViewFlowLayout *)[self.homeCollectionView collectionViewLayout];


    self.stockPhotosArray = @[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brandon"]],
                              [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"don.jpg"]],
                              [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"max"]],
                              [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kevin"]],
                              [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"thom"]],
                              [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aleshia"]],
                              [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ryan"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Delegates

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.stockPhotosArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    UIImageView *currentImageView = [self.stockPhotosArray objectAtIndex:indexPath.row];
    cell.cellImageView.image = currentImageView.image;


//    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100]; //just because
//    cell.cellImageView.image = [self.stockPhotosArray objectAtIndex:indexPath];

    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}









@end
