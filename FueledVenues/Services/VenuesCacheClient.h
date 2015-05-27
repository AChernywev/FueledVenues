//
//  VenuesCacheClient.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Venue.h"

@interface VenuesCacheClient : NSObject

- (void)loadVenuesWithCompletion:(void(^)(NSArray *venues))completion;
- (void)storeVenues:(NSArray *)venues;
@end
