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
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, strong) NSString *openMessage;
@property (nonatomic, assign) PriceTier tier;
@property (nonatomic, strong) NSString *tierMessage;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, assign) float rating;
@property (nonatomic, assign) float distance;
@property (nonatomic, assign) float latitude;
@property (nonatomic, assign) float longitude;
@property (nonatomic, strong) Photo *mainImage;

@end

#import "Venue+Parsing.h"
