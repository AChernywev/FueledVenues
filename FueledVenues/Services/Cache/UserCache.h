//
//  UserCache.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "PhotoCache.h"

@interface UserCache : BaseCacheEntity

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) PhotoCache *userPhoto;
@property (nonatomic, retain) NSSet *reviews;
@end

@interface UserCache (CoreDataGeneratedAccessors)

- (void)addReviewsObject:(NSManagedObject *)value;
- (void)removeReviewsObject:(NSManagedObject *)value;
- (void)addReviews:(NSSet *)values;
- (void)removeReviews:(NSSet *)values;

@end
