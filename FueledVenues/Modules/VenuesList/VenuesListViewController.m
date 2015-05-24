//
//  VenuesListViewController.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenuesListViewController.h"

#import "Venue.h"
#import "VenueCell.h"
#import "Macroses.h"
#import "UIColor+FVColors.h"

@implementation VenuesListViewController
@dynamic presenter;

#pragma mark - initialization
- (instancetype)initWithPresenter:(id<VenuesPresenterInput>)presenter
{
    self = [super initWithPresenter:presenter];
    return self;
}

#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"FUELED";
    self.view.backgroundColor = RGBColor(249, 244, 227);
    [self registerNibForCellClass:[VenueCell class] item:[Venue class] reuseIdentifier:kVenueCellReuseIdentifier];
    [self.presenter loadVenuesWithCompletion:^(NSError *error) {
    }];
}

- (CGFloat)rowHeightForItem:(id)item
{
    return 222;
}

@end
