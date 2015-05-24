//
//  RatingView.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingView : UIView
@property (nonatomic, assign) IBInspectable NSInteger numberOfStars;
@property (nonatomic, assign) IBInspectable NSInteger maxRating;

@property (nonatomic, assign) CGFloat rating;

@end
