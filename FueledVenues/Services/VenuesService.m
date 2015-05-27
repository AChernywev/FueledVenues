//
//  VenuesService.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenuesService.h"

#import "VenuesCacheClient.h"
#import "VenuesDataClient.h"

static NSInteger  const kDefaultNumberOfVenues = 50;

@interface VenuesService()
@property (nonatomic, readonly) VenuesCacheClient * cacheClient;
@property (nonatomic, readonly) VenuesDataClient *  dataClient;

@end

@implementation VenuesService

#pragma mark - initialization
- (instancetype)init
{
    self = [super init];
    if(self) {
        _dataClient = [VenuesDataClient new];
        _cacheClient = [VenuesCacheClient new];
    }
    return self;
}

#pragma mark - public methods
- (void)loadVenuesWithCompletion:(void(^)(NSArray *venues, NSError *error))completion
{
    NSArray *blackListed = [self.cacheClient loadBlacklistedVenues];
    
    NSArray *venues = [self.cacheClient loadVenues];
    [self finishWithVenues:venues error:nil
          blackListedArray:blackListed completion:completion];
    
    __weak typeof(self)weakSelf = self;
    [self.dataClient loadVenuesWithCount:kDefaultNumberOfVenues + blackListed.count
                              completion:^(NSArray *venues, NSError *error) {
                                  if(venues.count) {
                                      [weakSelf.cacheClient storeVenues:venues];
                                  }
                                  [weakSelf finishWithVenues:venues error:error
                                        blackListedArray:blackListed completion:completion];
                              }
     ];
}

- (void)addToBlackList:(Venue *)venue
{
    [self.cacheClient addToBlackList:venue];
}

#pragma mark - working methods
- (void)finishWithVenues:(NSArray *)venues
                   error:(NSError *)error
        blackListedArray:(NSArray *)blackListedArray
              completion:(void(^)(NSArray *venues, NSError *error))completion
{
    venues = [venues filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"NOT SELF IN %@", blackListedArray]];
    venues = [venues sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"distance" ascending:YES]]];
    if(completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(venues, error);
        });
    }
}
@end
