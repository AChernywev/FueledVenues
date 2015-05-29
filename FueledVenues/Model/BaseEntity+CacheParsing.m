//
//  BaseEntity+CacheParsing.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity+CacheParsing.h"

#import "CacheClient.h"

@implementation BaseEntity (CacheParsing)

- (instancetype)initWithCache:(BaseCacheEntity *)cache
{
    if(cache) {
        return [self initWithIdentifier:cache.identifier];
    }
    else {
        return nil;
    }
}

- (BaseCacheEntity *)fulfilledCacheWithClass:(Class)aClass client:(CacheClient *)cacheClient;
{
    if(cacheClient) {
        NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:NSStringFromClass([aClass class])];
        request.predicate = [NSPredicate predicateWithFormat:@"identifier==%@",self.identifier];
        BaseCacheEntity *cache = (BaseCacheEntity *)[cacheClient getEntityWithRequest:request];
        if(!cache) {
            cache = [cacheClient createObjectWithType:[aClass class]];
        }
        cache.identifier = self.identifier;
        return cache;
    }
    else {
        return nil;
    }
}
@end
