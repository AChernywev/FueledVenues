//
//  BaseEntity+CacheParsing.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity.h"

#import "BaseCacheEntity.h"

@class CacheClient;

@interface BaseEntity (CacheParsing)

- (instancetype)initWithCache:(BaseCacheEntity *)cache;
- (BaseCacheEntity *)fulfilledCacheWithClass:(Class)aClass client:(CacheClient *)cacheClient;
@end
