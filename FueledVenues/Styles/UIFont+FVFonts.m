//
//  UIFont+FVFonts.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "UIFont+FVFonts.h"

@implementation UIFont (FVFonts)

+ (UIFont *)thinFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Thin" size:size];
}

+ (UIFont *)regularFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

+ (UIFont *)mediumFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
}

+ (UIFont *)boldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:size];
}

+ (UIFont *)titleFont
{
    return [UIFont regularFontWithSize:20];
}

+ (UIFont *)textFont
{
    return [UIFont regularFontWithSize:16];
}
@end
