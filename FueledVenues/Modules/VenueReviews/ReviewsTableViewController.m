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

#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = LOC(@"reviewscontroller.title");
    self.view.backgroundColor = RGBColor(249, 244, 227);
    [self registerNibForCellClass:[ReviewTableViewCell class] item:[Review class] reuseIdentifier:kReviewCellReuseIdentifier];
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(updateAction:) forControlEvents:UIControlEventValueChanged];
    [self updateAction:self.refreshControl];
}

#pragma mark - superclass methods
- (CGFloat)rowHeightForItem:(id)item
{
    return kDynamicRowHeight;
}

#pragma mark - Segues transitions

@end
