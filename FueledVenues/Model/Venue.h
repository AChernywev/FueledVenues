//
//  Venue.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity.h"

typedef NS_ENUM(NSInteger, PriceTier)
{
    PriceTierMinimum,
    PriceTierLow,
    PriceTierHight,
    PriceTierMaximum
};

@interface Venue : BaseEntity
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *address;
@property (nonatomic, readonly) BOOL isOpen;
@property (nonatomic, readonly) NSString *openMessage;
@property (nonatomic, readonly) PriceTier tier;
@property (nonatomic, readonly) NSString *tierMessage;
@property (nonatomic, readonly) NSString *currency;
@property (nonatomic, readonly) float rating;
@property (nonatomic, readonly) float distance;
@property (nonatomic, readonly) float latitude;
@property (nonatomic, readonly) float longitude;
@property (nonatomic, readonly) NSURL *imageURL;

@end

#import "Venue+Parser.h"
