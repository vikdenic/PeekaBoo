//
//  DetailViewController.h
//  PeekaBoo
//
//  Created by Yeah Right on 6/6/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property NSManagedObjectContext *detailInstanceManagedObjectContext;
@property NSFetchedResultsController *fetchedResultsController;
@end
