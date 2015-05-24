//
//  Venue.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Venue.h"

#import "Macroses.h"

@interface Venue ()
@property (nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) NSString *address;
@property (nonatomic, readwrite) BOOL isOpen;
@property (nonatomic, readwrite) PriceTier tier;
@property (nonatomic, readwrite) NSString *tierMessage;
@property (nonatomic, readwrite) NSString *currency;
@property (nonatomic, readwrite) float rating;
@property (nonatomic, readwrite) float distance;
@property (nonatomic, readwrite) float latitude;
@property (nonatomic, readwrite) float longitude;
@property (nonatomic, readwrite) NSURL *imageURL;

@end

@implementation Venue

- (NSString *)openMessage
{
    if(self.isOpen) {
        return LOC(@"venue.opentitle");
    }
    else {
        return LOC(@"venue.closetitle");
    }
}

- (NSString *)tierMessage
{
    switch (self.tier) {
        case PriceTierMinimum: {
            return LOC(@"venue.cheaptier");
        }
            break;
        case PriceTierLow: {
            return LOC(@"venue.economytier");
        }
            break;
        case PriceTierHight: {
            return LOC(@"venue.expensivetier");
        }
            break;
        case PriceTierMaximum: {
            return LOC(@"venue.veryexpensivetier");
        }
            break;
            
        default: {
            NSAssert(NO, @"Unknown Price Tier");
            return nil;
        }
            break;
    }
}

@end
