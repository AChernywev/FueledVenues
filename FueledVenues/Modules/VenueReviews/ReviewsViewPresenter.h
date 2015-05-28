//
//  ReviewsViewPresenter.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "MutableSectionsPresenter.h"

#import "Constants.h"

@interface ReviewsViewPresenter : MutableSectionsPresenter

- (instancetype)initWithVenueIdentifier:(EntityIDType)venueIdentifier;
- (void)loadReviewsWithCompletion:(void(^)(NSError *error))completion;
@end
