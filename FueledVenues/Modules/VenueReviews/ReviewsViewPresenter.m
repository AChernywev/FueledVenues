//
//  ReviewsViewPresenter.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "ReviewsViewPresenter.h"

#import "ServiceLayer.h"
#import "SectionsPresenter+Protected.h"

@interface HeaderItem : NSObject <HeaderFooterItemProtocol>
@property (nonatomic, readwrite) NSString *title;

@end

@implementation HeaderItem
@synthesize title = _title;

- (BOOL)hasView
{
    return NO;
}

@end

@interface ReviewsViewPresenter()
@property (nonatomic, readwrite) EntityIDType venueIdentifier;

@end

@implementation ReviewsViewPresenter

#pragma mark - initialization
- (instancetype)initWithVenueIdentifier:(EntityIDType)venueIdentifier
{
    self = [super init];
    if(self) {
        _venueIdentifier = [venueIdentifier copy];
    }
    return self;
}

#pragma mark - public methods
- (void)loadReviewsWithCompletion:(void(^)(NSError *error))completion
{
    __weak typeof(self)weakSelf = self;
    [[ServiceLayer sharedDataProvider].venueService loadReviewsWithVenueIdentifier:self.venueIdentifier completion:^(NSArray *myReviews, NSArray *otherReview, NSError *error) {
        MutableSectionItem *firstSection = [[MutableSectionItem alloc]initWithRows:[NSMutableArray arrayWithArray: myReviews]];
        if(myReviews.count) {
            firstSection.headerItem = [HeaderItem new];
            ((HeaderItem*)firstSection.headerItem).title = @"My Reviews";
        }
        MutableSectionItem *secondSection = [[MutableSectionItem alloc]initWithRows:[NSMutableArray arrayWithArray: otherReview]];
        if(otherReview.count) {
            secondSection.headerItem = [HeaderItem new];
            ((HeaderItem*)secondSection.headerItem).title = @"Other Reviews";
        }
        [weakSelf updateSections: @[firstSection, secondSection]];
        if(completion) {
            completion(error);
        }
    }];
}

- (void)addReview:(Review *)review
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    [self insertItem:review atIndexPath:indexPath];
}
@end
