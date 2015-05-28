//
//  ReviewCache+CacheParsing.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Review+CacheParsing.h"

#import "ReviewCache.h"
#import "User+CacheParsing.h"

@implementation Review (CacheParsing)

- (instancetype)initWithCache:(ReviewCache *)cache
{
    self = [super initWithCache:cache];
    if(self) {
        self.text = cache.text;
        self.createdAt = cache.createdAt;
        self.venueID = cache.venueID;
        self.user = [[User alloc]initWithCache:cache.user];
    }
    return self;
}

- (ReviewCache *)fulfilledCacheWithClass:(Class)aClass client:(CacheClient *)cacheClient
{
    ReviewCache *resultCache = (ReviewCache *)[super fulfilledCacheWithClass:aClass client:cacheClient];
    resultCache.text = self.text;
    resultCache.createdAt = self.createdAt;
    resultCache.venueID = self.venueID;
    resultCache.user = (UserCache *)[self.user fulfilledCacheWithClass:[UserCache class] client:cacheClient];
    return resultCache;
}
@end
