//
//  TextLabel.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "TextLabel.h"

#import "UIView+FVStyles.h"
#import "UIFont+FVFonts.h"
#import "UIColor+FVColors.h"

@implementation TextLabel

- (void)setupAppearence
{
    [super setupAppearence];
    self.font = [UIFont textFont];
    self.textColor = [UIColor grayTextColor];
}

@end
