//
//  AppDelegate.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "AppDelegate.h"

#import "VenuesListViewController.h"

@implementation AppDelegate

#pragma mark - <UIApplicationDelegate> methods
- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    VenuesListViewController *listController = (VenuesListViewController *)[(UINavigationController *)self.window.rootViewController topViewController];
    listController.presenter = [VenuesPresenter new];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - singleton methods
+ (AppDelegate *)sharedDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

@end
