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
    self.tintColor = [UIColor whiteTextColor];
    self.barTintColor = [UIColor redBackgroundColor];
    self.titleTextAttributes = @{NSFontAttributeName : [UIFont mediumFontWithSize:18],
                                 NSForegroundColorAttributeName : [UIColor whiteTextColor]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont mediumFontWithSize:14]}
                                                forState:UIControlStateNormal];
}

@end
