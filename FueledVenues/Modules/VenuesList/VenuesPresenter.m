//
//  VenuesPresenter.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenuesPresenter.h"

#import "ServiceLayer.h"

@implementation VenuesPresenter

- (void)loadVenuesWithCompletion:(void(^)(NSError *error))completion
{
    [[ServiceLayer sharedDataProvider].venueService loadVenuesWithCompletion:^(NSArray *venues, NSError *error) {
        if(venues.count) {
            MutableSectionItem *section = [[MutableSectionItem alloc]initWithRows:[venues mutableCopy]];
            [self updateSections: @[section]];
        }
        if(completion) {
            completion(error);
        }
    }];
}
@end
