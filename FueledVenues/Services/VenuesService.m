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
    void(^venuesCompletion)(NSArray *, NSError *) = ^(NSArray *venues, NSError *error) {
        if(completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(venues, error);
            });
        }
    };
    
    [self.cacheClient loadVenuesWithCompletion:^(NSArray *venues) {
        venuesCompletion(venues, nil);
    }];
//    [self.dataClient loadVenuesWithCompletion:^(NSArray *venues, NSError *error) {
//        if(venues.count) {
//            [self.cacheClient storeVenues:venues];
//        }
//        venuesCompletion(venues, error);
//    }];
}
@end
