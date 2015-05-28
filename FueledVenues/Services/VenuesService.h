//
//  VenuesService.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Venue.h"
#import "Review.h"

@interface VenuesService : NSObject

- (void)addToBlackList:(Venue *)venue;
- (void)loadVenuesWithCompletion:(void(^)(NSArray *venues, NSError *error))completion;
- (void)loadReviewsForVenueWithIdentifier:(EntityIDType)venueID
                                completion:(void(^)(NSArray *reviews, NSError *error))completion;
@end
