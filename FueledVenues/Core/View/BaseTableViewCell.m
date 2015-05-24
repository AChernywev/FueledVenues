//
//  BaseTableViewCell.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseTableViewCell.h"

#import "UIView+FVStyles.h"

@implementation BaseTableViewCell
@synthesize item = _item;

- (void)setupAppearence
{
    [super setupAppearence];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    self.backgroundView = [UIView new];
}
@end
