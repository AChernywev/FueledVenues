//
//  AppDelegate.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow *window;

+ (AppDelegate *)sharedDelegate;
@end

