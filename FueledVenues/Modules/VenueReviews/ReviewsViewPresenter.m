//
//  ReviewsViewPresenter.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "ReviewsViewPresenter.h"

#import "ServiceLayer.h"

@interface ReviewsViewPresenter()
@property (nonatomic, copy) EntityIDType venueID;

@end

@implementation ReviewsViewPresenter

#pragma mark - initialization
- (instancetype)initWithVenueIdentifier:(EntityIDType)venueIdentifier
{
    self = [super init];
    if(self) {
        _venueID = [venueIdentifier copy];
    }
    return self;
}

#pragma mark - public methods
- (void)loadReviewsWithCompletion:(void(^)(NSError *error))completion
{
    __weak typeof(self)weakSelf = self;
    [[ServiceLayer sharedDataProvider].venueService loadReviewsWithVenueIdentifier:self.venueID completion:^(NSArray *myReviews, NSArray *otherReview, NSError *error) {
        MutableSectionItem *firstSection = [[MutableSectionItem alloc]initWithRows:[NSMutableArray arrayWithArray: myReviews]];
        MutableSectionItem *secondSection = [[MutableSectionItem alloc]initWithRows:[NSMutableArray arrayWithArray: otherReview]];
        [weakSelf updateSections: @[firstSection, secondSection]];
        if(completion) {
            completion(error);
        }
    }];
}
@end
