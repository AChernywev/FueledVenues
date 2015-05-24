//
//  UIFont+FVFonts.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (FVFonts)

+ (UIFont *)thinFontWithSize:(CGFloat)size;
+ (UIFont *)regularFontWithSize:(CGFloat)size;
+ (UIFont *)mediumFontWithSize:(CGFloat)size;
+ (UIFont *)boldFontWithSize:(CGFloat)size;

+ (UIFont *)titleFont;
+ (UIFont *)textFont;
@end
