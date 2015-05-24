//
//  RatingStarView.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, StarViewState)
{
    StarViewStateEmpty,
    StarViewStateMiddle,
    StarViewStateHighlighted
};

@interface RatingStarView : UIImageView
@property (nonatomic, assign) StarViewState starViewState;

- (instancetype)initWithImage:(UIImage *)image middleImage:(UIImage *)middleImage highlightedImage:(UIImage *)highlightedImage;
@end
