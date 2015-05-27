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
- (NSArray *)loadVenues
{
    NSArray *cachedVenues = [self.cacheClient objectsWithType:[VenueCache class]];
    NSArray *modelVenues = [cachedVenues map:^Venue *(VenueCache * object) {
        return [[Venue alloc]initWithCache:object];
    }];
    return modelVenues;
}

- (NSArray *)loadBlacklistedVenues
{
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:NSStringFromClass([VenueCache class])];
    request.predicate = [NSPredicate predicateWithFormat:@"blacklisted==YES"];
    NSArray *cachedVenues = [self.cacheClient getEntitiesWithRequest:request];
    NSArray *modelVenues = [cachedVenues map:^Venue *(VenueCache * object) {
        return [[Venue alloc]initWithCache:object];
    }];
    return modelVenues;
}

- (void)storeVenues:(NSArray *)venues
{
    for(Venue *venue in venues) {
        [venue fulfilledCacheWithClass:[VenueCache class] client:self.cacheClient];
    }
    [self.cacheClient saveDatabase];
}

- (void)addToBlackList:(Venue *)venue;
{
    VenueCache *venueCache = (VenueCache *)[venue fulfilledCacheWithClass:[VenueCache class] client:self.cacheClient];
    venueCache.blacklisted = YES;
    [self.cacheClient saveDatabase];
}
@end
