//
//  VenuesPresenter.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenuesPresenter.h"

#import "ServiceLayer.h"

@interface VenuesPresenter()
@property (nonatomic, readwrite) NSArray *venues;

@end

@implementation VenuesPresenter

- (void)loadVenuesWithCompletion:(void(^)(NSError *error))completion
{
    __weak typeof(self)weakSelf = self;
    [[ServiceLayer sharedDataProvider].venueService loadVenuesWithCompletion:^(NSArray *venues, NSError *error) {
        weakSelf.venues = venues;
        if(venues.count) {
            MutableSectionItem *section = [[MutableSectionItem alloc]initWithRows:[NSMutableArray arrayWithArray: venues]];
            [weakSelf updateSections: @[section]];
        }
        if(completion) {
            completion(error);
        }
    }];
}

- (void)handleRightUtiltyEventWithInex:(NSInteger)index atIndexPath:(NSIndexPath *)indexPath
{
    Venue *venue = [self itemAtIndexPath:indexPath];
    [[ServiceLayer sharedDataProvider].venueService addToBlackList:venue];
    [self removeItemAtIndexPath:indexPath];
}

@end
