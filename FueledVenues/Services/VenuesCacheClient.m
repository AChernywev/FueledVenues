//
//  VenuesCacheClient.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenuesCacheClient.h"

#import "CacheClient.h"
#import "NSArray+Map.h"
#import "VenueCache.h"
#import "Venue+CacheParsing.h"
#import "ReviewCache.h"
#import "Review+CacheParsing.h"

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

- (NSArray *)loadMyReviewsWithIdentifier:(EntityIDType)venueID
{
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:NSStringFromClass([ReviewCache class])];
    request.predicate = [NSPredicate predicateWithFormat:@"venueID==%@ AND ownReview==YES",venueID];
    return [self reviewsWithFetchRequest:request];
}

- (NSArray *)loadOtherReviewsWithIdentifier:(EntityIDType)venueID
{
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:NSStringFromClass([ReviewCache class])];
    request.predicate = [NSPredicate predicateWithFormat:@"venueID==%@ AND ownReview==NO",venueID];
    return [self reviewsWithFetchRequest:request];
}

- (void)storeReviews:(NSArray *)reviews
{
    for(Review *review in reviews) {
        [review fulfilledCacheWithClass:[ReviewCache class] client:self.cacheClient];
    }
    [self.cacheClient saveDatabase];
}

- (Review *)createReviewWithVenueIdentifier:(EntityIDType)venueID
                                       text:(NSString *)text
{
    ReviewCache *review = [self.cacheClient createObjectWithType:[ReviewCache class]];
    review.identifier = [[NSUUID UUID] UUIDString];
    review.ownReview = YES;
    review.text = text;
    review.venueID = venueID;
    review.createdAt = [NSDate date];
    review.user = nil;
    [self.cacheClient saveDatabase];
    
    return [[Review alloc]initWithCache:review];
}

#pragma mark - working methods
- (NSArray *)reviewsWithFetchRequest:(NSFetchRequest *)request
{
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:NO]];
    NSArray *cachedReviews = [self.cacheClient getEntitiesWithRequest:request];
    NSArray *modelReview = [cachedReviews map:^Review *(ReviewCache * object) {
        return [[Review alloc]initWithCache:object];
    }];
    return modelReview;
}
@end
