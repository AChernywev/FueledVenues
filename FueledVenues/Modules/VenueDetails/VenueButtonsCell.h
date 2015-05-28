//
//  VenueButtonsCell.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseTableViewCell.h"

FOUNDATION_EXPORT NSString * kVenueButtonsCellReuseIdentifier;
@class VenueButtonsCell;

@protocol VenueButtonsCellDelegate <NSObject>

- (void)venueButtonsCellDidSelectMenu:(VenueButtonsCell *)cell;
- (void)venueButtonsCellDidSelectReviews:(VenueButtonsCell *)cell;
- (void)venueButtonsCellDidSelectCall:(VenueButtonsCell *)cell;
- (void)venueButtonsCellDidSelectWeb:(VenueButtonsCell *)cell;
@end

@interface VenueButtonsCell : BaseTableViewCell
@property (nonatomic, weak) id<VenueButtonsCellDelegate>delegate;

@end
