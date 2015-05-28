//
//  Venue+CacheParsing.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Venue+CacheParsing.h"

#import "VenueCache.h"
#import "Photo+CacheParsing.h"

@implementation Venue (CacheParsing)

- (instancetype)initWithCache:(VenueCache *)cache
{
    self = [super initWithCache:cache];
    if(self) {
        self.name = cache.name;
        self.mainImage = [[Photo alloc]initWithCache:cache.mainImage];
        self.rating = cache.rating;
        self.isOpen = cache.isOpen;
        self.tier = cache.tier;
        self.distance = cache.distance;
        self.address = cache.address;
        self.longitude = cache.longitude;
        self.latitude = cache.latitude;
        self.phoneURL = [NSURL URLWithString: cache.phone];
        self.websiteURL = [NSURL URLWithString:cache.webURL];
        self.menuURL = [NSURL URLWithString:cache.menuURL];
        self.reviewsCount = cache.reviewsCount;
    }
    return self;
}

- (VenueCache *)fulfilledCacheWithClass:(Class)aClass client:(CacheClient *)cacheClient
{
    VenueCache *resultCache = (VenueCache *)[super fulfilledCacheWithClass:aClass client:cacheClient];
    resultCache.name = self.name;
    resultCache.mainImage = (PhotoCache *)[self.mainImage fulfilledCacheWithClass:[PhotoCache class] client:cacheClient];
    resultCache.rating = self.rating;
    resultCache.isOpen = self.isOpen;
    resultCache.tier = self.tier;
    resultCache.distance = self.distance;
    resultCache.address = self.address;
    resultCache.longitude = self.longitude;
    resultCache.latitude = self.latitude;
    resultCache.phone = self.phoneURL.absoluteString;
    resultCache.webURL = self.websiteURL.absoluteString;
    resultCache.menuURL = self.menuURL.absoluteString;
    resultCache.reviewsCount = self.reviewsCount;
    return resultCache;
}
@end
