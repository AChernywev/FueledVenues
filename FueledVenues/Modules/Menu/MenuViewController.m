//
//  MenuViewController.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "MenuViewController.h"

#import "MenuItem.h"
#import "Macroses.h"

@implementation MenuViewController

#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSInteger count = 3;
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    for(NSUInteger i = 0; i < count; i++) {
        MenuItem *item = [[MenuItem alloc]initWithType:i];
        UIViewController *controller = NavigationController([UIViewController new]);
        if(controller) {
            controller.tabBarItem.title = item.title;
            controller.tabBarItem.image = [UIImage imageNamed:item.imageName];
            controller.tabBarItem.selectedImage = [UIImage imageNamed:item.imageName];
            [viewControllers addObject:controller];
        }
    }
    self.viewControllers = viewControllers;
}

#pragma mark - <MenuViewProtocol>
- (void)openMenuAnimated:(BOOL)animated
{
    //Do nothing. TabBarController do not have menu to open
}

- (void)closeMenuAnimated:(BOOL)animated
{
    //Do nothing. TabBarController do not have menu to close
}

- (void)openMenuItem:(MenuItem *)item closeMenu:(BOOL)closeMenu animated:(BOOL)animated
{
    //Ignore closeMenu parameter. TabBarController do not have menu to close
    NSInteger index = 0;
    [self setSelectedIndex:index];
}
@end
