//
//  VenuesListViewController.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "TableViewController.h"

#import "VenuesPresenter.h"

@interface VenuesListViewController : TableViewController
@property (nonatomic, strong) VenuesPresenter *presenter;

- (instancetype)initWithPresenter:(VenuesPresenter *)presenter;
@end
