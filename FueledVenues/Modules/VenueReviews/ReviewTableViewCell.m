//
//  VenuesService.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "ReviewTableViewCell.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "Review.h"
#import "NSDateFormatter+Singleton.h"
#import "UIColor+FVColors.h"

NSString * kReviewCellReuseIdentifier = @"ReviewCellReuseIdentifier";

@interface ReviewTableViewCell ()
@property (nonatomic, weak) IBOutlet UIImageView *  userImageView;
@property (nonatomic, weak) IBOutlet UILabel *      userNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *      dateLabel;
@property (nonatomic, weak) IBOutlet UILabel *       reviewTextLabel;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *separatorHeight;

@end

@implementation ReviewTableViewCell

#pragma mark - lifecycle
- (void)awakeFromNib
{
    [super awakeFromNib];;
    self.userImageView.layer.cornerRadius = self.userImageView.bounds.size.width / 2.0;
    self.userImageView.layer.masksToBounds = YES;
    self.dateLabel.textColor = [UIColor grayTextColor];
    self.separatorHeight.constant = 0.5;
}

#pragma mark - properties
- (void)setItem:(Review *)item
{
    [super setItem:item];
    [self.userImageView sd_setImageWithURL:[item.user.userPhoto urlWithSize:self.userImageView.bounds.size] placeholderImage:[UIImage imageNamed:@"default-avatar"]];
    RAC(self.reviewTextLabel, text) = [RACObserve(item, text) takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.userNameLabel, text) = [RACObserve(item.user, userName) takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.dateLabel, text) = [[RACObserve(item, createdAt) map:^id(id value) {
        NSDateFormatter *dateFormatter = [NSDateFormatter sharedFormatter];
        [dateFormatter setDateFormat:@"dd MMMM yyyy"];
        return [dateFormatter stringFromDate:value];
    }]takeUntil:self.rac_prepareForReuseSignal];
}

#pragma mark - UITableViewCell methods
- (void)prepareForReuse
{
    [super prepareForReuse];
    self.userNameLabel.text = nil;
    self.dateLabel.text = nil;
    self.reviewTextLabel.text = nil;
}

@end
