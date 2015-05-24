//
//  VenueDetailsViewController.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "TableViewController.h"

#import "VenueDetailsPresenter.h"

@interface VenueDetailsViewController : TableViewController
@property (nonatomic, strong) VenueDetailsPresenter * presenter;

- (instancetype)initWithPresenter:(VenueDetailsPresenter *)presenter;
@end
