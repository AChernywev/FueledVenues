//
//  ReviewsTableViewController.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "TableViewController.h"

#import "ReviewsViewPresenter.h"

@interface ReviewsTableViewController : TableViewController
@property (nonatomic, strong) ReviewsViewPresenter *presenter;

- (instancetype)initWithPresenter:(ReviewsViewPresenter *)presenter;
@end
