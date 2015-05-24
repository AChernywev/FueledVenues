//
//  VenueCell.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <SWTableViewCell/SWTableViewCell.h>

#import "ViewItemProtocol.h"

extern NSString * const kVenueCellReuseIdentifier;

@interface VenueCell : SWTableViewCell <ViewItemProtocol>

@end
