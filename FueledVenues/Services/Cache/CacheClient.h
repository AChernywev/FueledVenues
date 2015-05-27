//
//  DatabaseClient.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>

@interface CacheClient : NSObject

- (instancetype)initWithCacheName:(NSString *)cacheName url:(NSURL *)cacheURL;

- (void)deleteObject:(NSManagedObject *)mObject;
- (void)deleteObjects:(NSArray *)items;

- (NSManagedObject *)getEntityWithTemplate:(NSString *)name variables:(NSDictionary *)variables;
- (NSArray *)getEntitiesWithTemplate:(NSString *)name variables:(NSDictionary *)variables;
- (NSManagedObject *)getEntityWithRequest:(NSFetchRequest *)request;
- (NSArray *)getEntitiesWithRequest:(NSFetchRequest *)request;

- (id)createObjectWithType:(Class)aClass;
- (NSArray *)objectsWithType:(Class)aClass;
- (void)saveDatabase;
@end