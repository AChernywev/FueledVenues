//
//  VenueDetailsViewController.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenueDetailsViewController.h"

#import "Macroses.h"
#import "VenueCell.h"
#import "VenueButtonsCell.h"
#import "VenueAddressCell.h"
#import "VenueContactItem.h"

@implementation VenueDetailsViewController
@dynamic presenter;

- (instancetype)initWithPresenter:(VenueDetailsPresenter *)presenter
{
    self = [super initWithPresenter:presenter];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.presenter.title;
    self.view.backgroundColor = RGBColor(249, 244, 227);
    [self registerNibForCellClass:[VenueCell class] item:[Venue class] reuseIdentifier:kVenueCellReuseIdentifier];
    [self registerNibForCellClass:[VenueButtonsCell class] item:[VenueContactItem class] reuseIdentifier:kVenueButtonsCellReuseIdentifier];
    [self registerNibForCellClass:[VenueAddressCell class] item:[NSString class] reuseIdentifier:kVenueAddressCellReuseIdentifier];
    [self.presenter updateInfo];
}

- (CGFloat)rowHeightForItem:(id)item
{
    return kDynamicRowHeight;
}

@end
