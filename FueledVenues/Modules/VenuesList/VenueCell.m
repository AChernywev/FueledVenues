//
//  VenueCell.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenueCell.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "Venue.h"
#import "RatingView.h"

NSString  * const kVenueCellReuseIdentifier = @"VenueCellReuseIdentifier";

@interface VenueCell ()
@property (nonatomic, weak) IBOutlet UIImageView *venueImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet RatingView *ratingView;
@property (nonatomic, weak) IBOutlet UILabel *openLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UILabel *distanceLabel;

@property (nonatomic, weak) IBOutlet UIView *shadowView;

@end

@implementation VenueCell
@synthesize item = _item;

#pragma mark - lifecycle
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    self.backgroundView = [UIView new];
    
    self.shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.shadowView.layer.shadowOpacity = 0.4f;
    self.shadowView.layer.shadowOffset = CGSizeZero;
    self.shadowView.layer.shadowRadius = 1.0f;
    self.shadowView.layer.masksToBounds = NO;
}

#pragma mark - <ViewItemProtocol>
- (void)setItem:(Venue *)item
{
    _item = item;
    
    [self.venueImageView sd_setImageWithURL:[item.mainImage urlWithSize:self.venueImageView.bounds.size]];
    RAC(self.nameLabel, text) = [RACObserve(item, name) takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.ratingView, rating) = [RACObserve(item, rating) takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.openLabel, text) = [RACObserve(item, openMessage) takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.priceLabel, text) = [RACObserve(item, tierMessage) takeUntil:self.rac_prepareForReuseSignal];
    RAC(self.distanceLabel, text) = [[RACObserve(item, distance) map:^id(NSNumber * value) {
        return [NSString stringWithFormat:@"%@", value];
    }] takeUntil:self.rac_prepareForReuseSignal];
}

- (void)drawRect:(CGRect)rect
{
    CGSize size = self.shadowView.bounds.size;
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    CGFloat curve = 5;
    
    //right
   // [path moveToPoint:CGPointMake(5, 0)];
    [path moveToPoint:CGPointMake(size.width, 5.0f)];
    [path addLineToPoint:CGPointMake(size.width, size.height + curve)];
    
    //[path addLineToPoint:CGPointMake(5, size.height)];
    
    //curved bottom
    [path addCurveToPoint:CGPointMake(0, size.height + curve)
            controlPoint1:CGPointMake(size.width - curve, size.height)
            controlPoint2:CGPointMake(curve, size.height)];
    
    [path addLineToPoint:CGPointMake(0, 5)];
    //[path closePath];
    self.shadowView.layer.shadowPath = path.CGPath;
}

@end
