//
//  ReviewCache.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseCacheEntity.h"
#import "UserCache.h"

@interface ReviewCache : BaseCacheEntity

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic) BOOL ownReview;
@property (nonatomic, retain) NSString *venueID;
@property (nonatomic, retain) UserCache *user;

@end
