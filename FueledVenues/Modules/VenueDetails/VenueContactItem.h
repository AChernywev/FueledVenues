//
//  VenueContactItem.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseItem.h"

#import "Constants.h"

@interface VenueContactItem : BaseItem
@property (nonatomic, readonly) EntityIDType venueIdentifier;
@property (nonatomic, readonly) NSString *phone;
@property (nonatomic, readonly) NSURL *websiteURL;
@property (nonatomic, readonly) NSURL *menuURL;
@property (nonatomic, readonly) NSInteger reviewsCount;

@end
