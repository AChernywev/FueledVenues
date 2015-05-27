//
//  Venue.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity.h"

#import "Photo.h"

typedef NS_ENUM(int32_t, PriceTier)
{
    PriceTierMinimum,
    PriceTierLow,
    PriceTierHight,
    PriceTierMaximum
};

@interface Venue : BaseEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Photo *mainImage;
@property (nonatomic, assign) float rating;

@property (nonatomic, assign) bool isOpen;
@property (nonatomic, assign) PriceTier tier;
@property (nonatomic, assign) float distance;

@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) float latitude;
@property (nonatomic, assign) float longitude;

@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSURL *websiteURL;
@property (nonatomic, strong) NSURL *menuURL;
@property (nonatomic, assign) int32_t reviewsCount;




@property (nonatomic, readonly) NSString *openMessage;
@property (nonatomic, readonly) NSString *tierMessage;
@end

#import "Venue+Parsing.h"
