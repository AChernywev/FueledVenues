//
//  TitleLabel.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "TitleLabel.h"

#import "UIView+FVStyles.h"
#import "UIFont+FVFonts.h"
#import "UIColor+FVColors.h"

@implementation TitleLabel

- (void)setupAppearence
{
    [super setupAppearence];
    self.font = [UIFont titleFont];
    self.textColor = [UIColor whiteTextColor];
}

@end
