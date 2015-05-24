//
//  RatingStarView.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "RatingStarView.h"

@interface RatingStarView ()
@property (nonatomic, strong) UIImage *emptyImage;
@property (nonatomic, strong) UIImage *middleImage;

@end

@implementation RatingStarView

#pragma mark - initialization
- (instancetype)initWithImage:(UIImage *)image
                  middleImage:(UIImage *)middleImage
             highlightedImage:(UIImage *)highlightedImage
{
    self = [super initWithImage:image highlightedImage:highlightedImage];
    if(self) {
        self.emptyImage = image;
        self.middleImage = middleImage;
    }
    return self;
}

#pragma mark - properties
- (void)setStarViewState:(StarViewState)starViewState
{
    _starViewState = starViewState;
    switch (starViewState) {
        case StarViewStateEmpty: {
            self.highlighted = NO;
            self.image = self.emptyImage;
        }
            break;
        case StarViewStateMiddle: {
            self.highlighted = NO;
            self.image = self.middleImage;
        }
            break;
        case StarViewStateHighlighted: {
            self.highlighted = YES;
        }
            break;
            
        default: {
            NSAssert(NO, @"Unknown State");
        }
            break;
    }
}

@end
