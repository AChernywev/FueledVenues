//
//  UIColor+FVColors.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "UIColor+FVColors.h"

#import "Macroses.h"

@implementation UIColor (FVColors)

+ (UIColor *)grayTextColor
{
    return RGBAColor(0, 0, 0, 0.5);
}

+ (UIColor *)orangeTextColor
{
    return RGBColor(236, 145, 47);
}

+ (UIColor *)whiteTextColor
{
    return RGBColor(255, 255, 255);
}


+ (UIColor *)redBackgroundColor
{
    return RGBColor(174, 0, 0);
}

+ (UIColor *)darkBackgroundColor
{
    return RGBColor(37, 37, 37);
}
@end
