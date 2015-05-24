//
//  MenuViewController.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MenuViewProtocol.h"
#import "MenuViewPresenter.h"

@interface MenuViewController : UITabBarController <MenuViewProtocol>
@property (nonatomic, strong) MenuViewPresenter *presenter;

- (instancetype)initWithPresenter:(MenuViewPresenter *)presenter;
@end
