//
//  RatingView.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "RatingView.h"

#import "RatingStarView.h"
#import "UIColor+FVColors.h"
#import "UIFont+FVFonts.h"

@interface RatingView ()
@property (nonatomic, strong) NSMutableArray *stars;
@property (nonatomic, weak) UILabel *ratingLabel;

@end

@implementation RatingView

#pragma mark - initialization
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self customInit];
    }
    return self;
}

- (void)customInit
{
    self.stars = [NSMutableArray array];
    self.numberOfStars = 5;
    self.maxRating = 10;
}

#pragma mark - public methods
- (void)setRating:(CGFloat)rating
{
    _rating = rating;
    NSInteger step = self.maxRating / self.numberOfStars;
    
    NSInteger numOfFul = (NSInteger)(rating / step);
    CGFloat remains = rating - numOfFul * step;
    
    for(NSInteger i = 0; i < numOfFul; i++) {
        RatingStarView *starView = [self.stars objectAtIndex:i];
        starView.starViewState = StarViewStateHighlighted;
    }
    
    if(remains > step / 2) {
        RatingStarView *starView = [self.stars objectAtIndex:numOfFul];
        starView.starViewState = StarViewStateMiddle;
        numOfFul ++;
    }
    
    for(NSInteger i = numOfFul; i < self.numberOfStars; i++) {
        RatingStarView *starView = [self.stars objectAtIndex:i];
        starView.starViewState = StarViewStateEmpty;
    }
    self.ratingLabel.text = [NSString stringWithFormat:@"%.1f",rating];
}

- (void)setNumberOfStars:(NSInteger)numberOfStars
{
    _numberOfStars = numberOfStars;
    [self setupAllViews];
}

#pragma mark - working methods
- (void)setupAllViews
{
    [self.stars removeAllObjects];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIView *prevView = nil;
    for(NSInteger i = 0; i < self.numberOfStars; i++) {
        UIView *starView = nil;
        if(i == 0) {
            starView = [self configureFirstView];
        }
        else if(i == (self.numberOfStars - 1)) {
            starView = [self configureLastViewToView:prevView];
        }
        else {
            starView = [self configureMiddleViewToView:prevView];
        }
        
        if(prevView) {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:starView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:prevView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
        }
        prevView = starView;
    }
}

- (UIView *)addStarView
{
    RatingStarView *starView = [[RatingStarView alloc]initWithImage:[UIImage imageNamed:@"RatingStarEmpty"]
                                                        middleImage:[UIImage imageNamed:@"RatingStarMiddle"]
                                                   highlightedImage:[UIImage imageNamed:@"RatingStarFull"]];
    starView.contentMode = UIViewContentModeScaleAspectFit;
    [starView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.stars addObject:starView];
    [self addSubview:starView];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:starView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:starView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    return starView;
}

- (UIView *)configureFirstView
{
    UIView *starView = [self addStarView];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:starView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0]];
    return starView;
}

- (UIView *)configureMiddleViewToView:(UIView *)prevStar
{
    UIView *starView = [self addStarView];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:starView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:prevStar attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];
    return starView;
}

- (UIView *)configureLastViewToView:(UIView *)prevStar
{
    UIView *starView = [self configureMiddleViewToView:prevStar];
    [self addLabelToView:starView];
    return starView;
}

- (void)addLabelToView:(UIView *)starView
{
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont regularFontWithSize:16];
    label.textColor = [UIColor orangeTextColor];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:label];
    self.ratingLabel = label;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:starView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:2]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:label attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:label attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];
}

@end
