//
//  VenueContactItem.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenueContactItem.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "BaseItem_Protected.h"
#import "Venue.h"

@interface VenueContactItem ()
@property (nonatomic, strong) Venue *object;
@end

@implementation VenueContactItem
@dynamic object;

#pragma mark - propertis
- (EntityIDType)venueIdentifier
{
    return self.object.identifier;
}

- (NSURL *)phoneURL
{
    return self.object.phoneURL;
}

- (NSURL *)menuURL
{
    return self.object.menuURL;
}

- (NSURL *)websiteURL
{
    return self.object.websiteURL;
}

- (NSInteger)reviewsCount
{
    return self.object.reviewsCount;
}

+ (NSSet *)keyPathsForValuesAffectingPhone
{
    return [NSSet setWithObject:@"object.phoneURL"];
}

+ (NSSet *)keyPathsForValuesAffectingMenuURL
{
    return [NSSet setWithObject:@"object.menuURL"];
}

+ (NSSet *)keyPathsForValuesAffectingWebsiteURL
{
    return [NSSet setWithObject:@"object.websiteURL"];
}

+ (NSSet *)keyPathsForValuesAffectingReviewsCount
{
    return [NSSet setWithObject:@"object.reviewsCount"];
}
@end
