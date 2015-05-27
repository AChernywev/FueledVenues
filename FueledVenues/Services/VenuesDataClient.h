//
//  VenuesDataClient.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "APIService.h"

#import "Venue.h"

@interface VenuesDataClient : NSObject

- (void)loadVenuesWithCompletion:(void(^)(NSArray *venues, NSError *error))completion;
@end
