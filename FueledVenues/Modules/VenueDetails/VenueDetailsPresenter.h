//
//  VenueDetailsPresenter.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "MutableSectionsPresenter.h"

#import "Venue.h"

@interface VenueDetailsPresenter : MutableSectionsPresenter
@property (nonatomic, readonly) NSString *title;

- (instancetype)initWithVenue:(Venue *)venue;
- (void)updateInfo;
@end
