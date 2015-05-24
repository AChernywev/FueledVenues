//
//  FoursquareAPI.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Venue.h"

@interface FoursquareAPI : NSObject

- (void)loadClosestVenuesWithCompletion:(void(^)(NSArray *venues, NSError *error))completion;
- (void)loadFullInfoForVenue:(Venue *)venue;
@end