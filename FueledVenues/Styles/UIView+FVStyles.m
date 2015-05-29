//
//  UIFont+FVStyles.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "UIView+FVStyles.h"

#import "NSObject+Swizzle.h"

@implementation UIView (FVStyles)

#pragma mark - class loading methods
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSelector:@selector(initWithFrame:) onSelector:@selector(xxx_initWithFrame:)];
        [self swizzleSelector:@selector(awakeFromNib) onSelector:@selector(xxx_awakeFromNib)];
    });
}

#pragma mark - initialization
- (instancetype)xxx_initWithFrame:(CGRect)frame
{
    id result = [self xxx_initWithFrame:frame];
    [result setupAppearence];
    return result;
}

- (void)xxx_awakeFromNib
{
    [self xxx_awakeFromNib];
    [self setupAppearence];
}

- (void)setupAppearence
{
}

@end
