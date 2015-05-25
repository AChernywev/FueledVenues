//
//  VenueContactItem.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenueContactItem.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface VenueContactItem ()
@property (nonatomic, strong) Venue *venue;

@end

@implementation VenueContactItem

- (instancetype)initWithVenue:(Venue *)venue
{
    self = [super init];
    if(self) {
        _venue = venue;
    }
    return self;
}

#pragma mark - propertis
- (NSString *)phone
{
    return self.venue.phone;
}

- (NSURL *)menuURL
{
    return self.venue.menuURL;
}

- (NSURL *)websiteURL
{
    return self.venue.websiteURL;
}

- (NSInteger)reviewsCount
{
    return self.venue.reviewsCount;
}

+ (NSSet *)keyPathsForValuesAffectingPhone
{
    return [NSSet setWithObject:@"venue.phone"];
}

+ (NSSet *)keyPathsForValuesAffectingMenuURL
{
    return [NSSet setWithObject:@"venue.menuURL"];
}

+ (NSSet *)keyPathsForValuesAffectingWebsiteURL
{
    return [NSSet setWithObject:@"venue.websiteURL"];
}

+ (NSSet *)keyPathsForValuesAffectingReviewsCount
{
    return [NSSet setWithObject:@"venue.reviewsCount"];
}
@end
