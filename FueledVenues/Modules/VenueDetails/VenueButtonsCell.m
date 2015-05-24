//
//  VenueButtonsCell.m
///  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenueButtonsCell.h"

NSString * kVenueButtonsCellReuseIdentifier = @"VenueButtonsCellReuseIdentifier";

@interface VenueButtonsCell ()
@property (nonatomic, weak) IBOutlet UIButton *menuButton;
@property (nonatomic, weak) IBOutlet UIButton *reviewsButton;
@property (nonatomic, weak) IBOutlet UILabel *reviewsCountLabel;
@property (nonatomic, weak) IBOutlet UIButton *dealsButton;

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

- (IBAction)dealsAction:(id)sender
{
    if([self.delegate respondsToSelector:@selector(venueButtonsCellDidSelectDeals:)]) {
        [self.delegate venueButtonsCellDidSelectDeals:self];
    }
}

#pragma mark - public methods
- (void)setItem:(id)item
{
    [super setItem:item];
//    self.reviewsCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)restaurant.reviews.count];
//    self.reviewsButton.enabled = (restaurant.reviews.count > 0);
//    self.reviewsCountLabel.textColor = restaurant.reviews.count > 0 ? kOrangeBackgroundColor : RGBAColor(255, 142, 32, 0.6);
//
//    self.dealsButton.enabled = (restaurant.offers.count > 0);
}

#pragma mark - UITableViewCell methods
- (void)prepareForReuse
{
    [super prepareForReuse];
    self.reviewsButton.enabled = YES;
    self.reviewsCountLabel.text = nil;
    self.dealsButton.enabled = NO;
}
@end
