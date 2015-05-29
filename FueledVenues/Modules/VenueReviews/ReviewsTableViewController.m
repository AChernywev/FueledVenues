//
//  ReviewsTableViewController.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "ReviewsTableViewController.h"

#import "Review.h"
#import "ReviewTableViewCell.h"
#import "Macroses.h"
#import "UIColor+FVColors.h"
#import "ReviewCreateViewController.h"

@implementation ReviewsTableViewController
@dynamic presenter;

#pragma mark - initialization
- (instancetype)initWithPresenter:(ReviewsViewPresenter *)presenter
{
    self = [super initWithPresenter:presenter];
    return self;
}

#pragma mark - Actions
- (IBAction)updateAction:(UIRefreshControl *)refreshControl
{
    [refreshControl beginRefreshing];
    [self.presenter loadReviewsWithCompletion:^(NSError *error) {
        if(!error) {
        }
        [refreshControl endRefreshing];
    }];
}

- (IBAction)dismissSegueAction:(UIStoryboardSegue *)sender
{
    
}

#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = LOC(@"reviewscontroller.title");
    self.tableView.backgroundView = [UIView new];
    self.view.backgroundColor = [UIColor viewBackgroundColor];
    
    [self registerNibForCellClass:[ReviewTableViewCell class] item:[Review class] reuseIdentifier:kReviewCellReuseIdentifier];
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(updateAction:) forControlEvents:UIControlEventValueChanged];
    [self updateAction:self.refreshControl];
}

#pragma mark - public metods
- (void)addReview:(Review *)review
{
    [self.presenter addReview:review];
}

#pragma mark - superclass methods
- (CGFloat)rowHeightForItem:(id)item
{
    return kDynamicRowHeight;
}

- (CGFloat)headerHeightForItem:(id<HeaderFooterItemProtocol>)item
{
    if(item) {
        return 44.0;
    }
    else {
        return 0.01f;
    }
}

- (CGFloat)footerHeightForItem:(id<HeaderFooterItemProtocol>)item
{
    return 0.01;
}

#pragma mark - Segues transitions
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[ReviewCreateViewController class]]) {
        ReviewCreateViewController *createController = (ReviewCreateViewController *)segue.destinationViewController;
        createController.venueIdentifier = self.presenter.venueIdentifier;
    }
}
@end
