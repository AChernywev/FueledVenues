//
//  Venue.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Venue.h"

#import "Macroses.h"

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
        case PriceTierUnknown: {
            return LOC(@"venue.unknowntier");
        }
            break;
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

- (NSUInteger)hash
{
    return [self.identifier hash];
}

- (BOOL)isEqual:(Venue *)object
{
    return [object.identifier isEqualToString:self.identifier];
}

+ (NSSet *)keyPathsForValuesAffectingTierMessage
{
    return [NSSet setWithObject:@"tier"];
}

+ (NSSet *)keyPathsForValuesAffectingOpenMessage
{
    return [NSSet setWithObject:@"isOpen"];
}
@end
