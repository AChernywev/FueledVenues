//
//  User+CacheParsing.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "User+CacheParsing.h"

#import "UserCache.h"
#import "Photo+CacheParsing.h"

@implementation User (CacheParsing)

- (instancetype)initWithCache:(UserCache *)cache
{
    self = [super initWithCache:cache];
    if(self) {
        self.firstName = cache.firstName;
        self.lastName = cache.lastName;
        self.userPhoto = [[Photo alloc]initWithCache:cache.userPhoto];
    }
    return self;
}

- (UserCache *)fulfilledCacheWithClass:(Class)aClass client:(CacheClient *)cacheClient
{
    UserCache *resultCache = (UserCache *)[super fulfilledCacheWithClass:aClass client:cacheClient];
    resultCache.firstName = self.firstName;
    resultCache.lastName = self.lastName;
    resultCache.userPhoto = (PhotoCache *)[self.userPhoto fulfilledCacheWithClass:[PhotoCache class] client:cacheClient];
    return resultCache;
}
@end
