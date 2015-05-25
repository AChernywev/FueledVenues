//
//  Venue.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity.h"

#import "Photo.h"

typedef NS_ENUM(NSInteger, PriceTier)
{
    PriceTierMinimum,
    PriceTierLow,
    PriceTierHight,
    PriceTierMaximum
};

@interface Venue : BaseEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) PriceTier tier;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, assign) float rating;

@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) float distance;
@property (nonatomic, assign) float latitude;
@property (nonatomic, assign) float longitude;

@property (nonatomic, readonly) NSString *phone;
@property (nonatomic, readonly) NSURL *websiteURL;
@property (nonatomic, readonly) NSURL *menuURL;
@property (nonatomic, assign) NSInteger reviewsCount;

@property (nonatomic, strong) Photo *mainImage;



@property (nonatomic, readonly) NSString *openMessage;
@property (nonatomic, readonly) NSString *tierMessage;
@end

#import "Venue+Parsing.h"
