//
//  AppDelegate.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "AppDelegate.h"

#import "MenuViewController.h"

@implementation AppDelegate

#pragma mark - <UIApplicationDelegate> methods
- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[MenuViewController alloc]initWithPresenter:[MenuViewPresenter new]];
    
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - singleton methods
+ (AppDelegate *)sharedDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark - properties
- (id<MenuViewProtocol>)rootMenu
{
    return (id<MenuViewProtocol>)self.window.rootViewController;
}
@end
