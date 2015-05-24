//
//  FVNavigationBar.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "FVNavigationBar.h"

#import "UIColor+FVColors.h"
#import "UIFont+FVFonts.h"

@implementation FVNavigationBar

- (void)setupAppearence
{
    [super setupAppearence];
    [self setTranslucent:NO];
    self.tintColor = [UIColor whiteColor];
    self.barTintColor = [UIColor redBackgroundColor];
    self.titleTextAttributes = @{
                                 NSFontAttributeName               : [UIFont mediumFontWithSize:18],
                                 NSForegroundColorAttributeName    : [UIColor whiteTextColor],
                                 };
//    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
//                                                           NSFontAttributeName               : [UIFont pg_fontA1],
//                                                           NSForegroundColorAttributeName    : [UIColor pg_redColor],
//                                                           } forState:UIControlStateNormal];
}

@end
