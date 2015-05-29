//
//  VenuesCacheClient.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Venue.h"
#import "Review.h"

@interface VenuesCacheClient : NSObject

- (NSArray *)loadBlacklistedVenues;
- (NSArray *)loadVenues;
- (void)storeVenues:(NSArray *)venues;
- (void)addToBlackList:(Venue *)venue;

- (NSArray *)loadMyReviewsWithIdentifier:(EntityIDType)venueID;
- (NSArray *)loadOtherReviewsWithIdentifier:(EntityIDType)venueID;
- (void)storeReviews:(NSArray *)reviews;
- (Review *)createReviewWithVenueIdentifier:(EntityIDType)venueID
                                       text:(NSString *)text;
@end
