//
//  VenueContactItem.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Venue.h"

@interface VenueContactItem : NSObject
@property (nonatomic, readonly) NSString *phone;
@property (nonatomic, readonly) NSURL *websiteURL;
@property (nonatomic, readonly) NSURL *menuURL;
@property (nonatomic, assign) NSInteger reviewsCount;

- (instancetype)initWithVenue:(Venue *)venue;
@end
