//
//  AppDelegate.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MenuViewProtocol.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, readonly) id<MenuViewProtocol> rootMenu;

+ (AppDelegate *)sharedDelegate;
@end

