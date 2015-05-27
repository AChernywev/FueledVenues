//
//  VenuesCacheClient.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenuesCacheClient.h"

#import "CacheClient.h"
#import "VenueCache.h"
#import "NSArray+Map.h"
#import "Venue+CacheParsing.h"

@interface VenuesCacheClient ()
@property (nonatomic, readonly) CacheClient *cacheClient;

@end

@implementation VenuesCacheClient

#pragma mark - initialization
- (instancetype)init
{
    self = [super init];
    if(self) {
        _cacheClient = [CacheClient new];
    }
    return self;
}

#pragma mark - public methods
- (void)loadVenuesWithCompletion:(void(^)(NSArray *venues))completion
{
    NSArray *cachedVenues = [self.cacheClient objectsWithType:[VenueCache class]];
    NSArray *modelVenues = [cachedVenues map:^Venue *(VenueCache * object) {
        return [[Venue alloc]initWithCache:object];
    }];
    if(completion) {
        completion(modelVenues);
    }
}

- (void)storeVenues:(NSArray *)venues
{
    for(Venue *venue in venues) {
        [venue fulfilledCacheWithClass:[VenueCache class] client:self.cacheClient];
    }
    [self.cacheClient saveDatabase];
}
@end
