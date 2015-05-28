//
//  VenueButtonsCell.m
///  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenueButtonsCell.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "VenueContactItem.h"

NSString * kVenueButtonsCellReuseIdentifier = @"VenueButtonsCellReuseIdentifier";

@interface VenueButtonsCell ()
@property (nonatomic, weak) IBOutlet UIButton *menuButton;
@property (nonatomic, weak) IBOutlet UIButton *reviewsButton;
@property (nonatomic, weak) IBOutlet UIButton *callButton;
@property (nonatomic, weak) IBOutlet UIButton *webButton;

@end

@implementation VenueButtonsCell

#pragma mark - Actions
- (IBAction)menuAction:(id)sender
{
    if([self.delegate respondsToSelector:@selector(venueButtonsCellDidSelectMenu:)]) {
        [self.delegate venueButtonsCellDidSelectMenu:self];
    }
}

- (IBAction)reviewsAction:(id)sender
{
    if([self.delegate respondsToSelector:@selector(venueButtonsCellDidSelectReviews:)]) {
        [self.delegate venueButtonsCellDidSelectReviews:self];
    }
}

- (IBAction)callAction:(id)sender
{
    if([self.delegate respondsToSelector:@selector(venueButtonsCellDidSelectCall:)]) {
        [self.delegate venueButtonsCellDidSelectCall:self];
    }
}

- (IBAction)webAction:(id)sender
{
    if([self.delegate respondsToSelector:@selector(venueButtonsCellDidSelectWeb:)]) {
        [self.delegate venueButtonsCellDidSelectWeb:self];
    }
}
#pragma mark - public methods
- (void)setItem:(VenueContactItem *)item
{
    [super setItem:item];
    RAC(self.callButton, enabled) = [[RACObserve(item, phoneURL) map:^id(NSString *value) {
        return @(value != nil);
    }] takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.webButton, enabled) = [[RACObserve(item, websiteURL) map:^id(NSString *value) {
        return @(value != nil);
    }] takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.menuButton, enabled) = [[RACObserve(item, menuURL) map:^id(NSString *value) {
        return @(value != nil);
    }] takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.reviewsButton, enabled) = [[RACObserve(item, reviewsCount) map:^id(NSNumber *value) {
        return @(value.integerValue > 0);
    }] takeUntil:self.rac_prepareForReuseSignal];
}

#pragma mark - UITableViewCell methods
- (void)prepareForReuse
{
    [super prepareForReuse];
    self.callButton.enabled = YES;
    self.webButton.enabled = YES;
    self.menuButton.enabled = YES;
    self.reviewsButton.enabled = YES;
}
@end
