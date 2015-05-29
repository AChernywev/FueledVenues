//
//  ReviewsViewPresenter.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "MutableSectionsPresenter.h"

#import "Constants.h"
#import "Review.h"

@interface ReviewsViewPresenter : MutableSectionsPresenter
@property (nonatomic, readonly) EntityIDType venueIdentifier;

- (instancetype)initWithVenueIdentifier:(EntityIDType)venueIdentifier;
- (void)loadReviewsWithCompletion:(void(^)(NSError *error))completion;
- (void)addReview:(Review *)review;
@end
