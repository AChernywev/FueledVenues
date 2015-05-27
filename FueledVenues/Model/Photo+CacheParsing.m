//
//  Photo+CacheParsing.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Photo+CacheParsing.h"

#import "PhotoCache.h"

@implementation Photo (CacheParsing)

- (instancetype)initWithCache:(PhotoCache *)cache
{
    self = [super initWithCache:cache];
    if(self) {
        self.prefix = cache.prefix;
        self.suffix = cache.suffix;
    }
    return self;
}

- (PhotoCache *)fulfilledCacheWithClass:(Class)aClass client:(CacheClient *)cacheClient
{
    PhotoCache *resultCache = (PhotoCache *)[super fulfilledCacheWithClass:aClass client:cacheClient];
    resultCache.prefix = self.prefix;
    resultCache.suffix = self.suffix;
    return resultCache;
}
@end
