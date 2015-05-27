//
//  VenueCache.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "PhotoCache.h"

@interface VenueCache : BaseCacheEntity

@property (nonatomic, retain) NSString * name;
@property (nonatomic) float rating;
@property (nonatomic) BOOL isOpen;
@property (nonatomic) int32_t tier;
@property (nonatomic) float distance;
@property (nonatomic, retain) NSString * address;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * webURL;
@property (nonatomic, retain) NSString * menuURL;
@property (nonatomic) int32_t reviewsCount;
@property (nonatomic, retain) PhotoCache *mainImage;

@end
