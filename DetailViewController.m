//
//  DetailViewController.m
//  PeekaBoo
//
//  Created by Yeah Right on 6/6/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "DetailViewController.h"
#import "User.h"

@interface DetailViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property NSMutableArray *fetchArray;
@property CGFloat x;
@end

@implementation DetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.x = 0.0;
    [self fetchRequestMethod];
    self.myScrollView.delegate = self;
    self.myScrollView.maximumZoomScale = 5.0;
    self.myScrollView.minimumZoomScale = 1.0;

}
- (void)fetchRequestMethod
{
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"User"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:self.detailInstanceManagedObjectContext sectionNameKeyPath:nil cacheName:nil];
    [self.fetchedResultsController performFetch:nil];
    self.fetchArray = (NSMutableArray *)[self.fetchedResultsController fetchedObjects];
    [self addImagesToView];
}

- (void)addImagesToView
{
    for (User *user in self.fetchArray)
        {
        UIImage *image = [UIImage imageWithData: user.imgData];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(self.x, 0, self.view.frame.size.width, self.view.frame.size.height);
        imageView.contentMode= UIViewContentModeScaleAspectFit;
        self.x += self.view.frame.size.width;
        [self.myScrollView addSubview:imageView];
        }
    self.myScrollView.contentSize = CGSizeMake(self.x, self.view.frame.size.height);
}

@end
