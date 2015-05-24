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
#import "VenuesListViewController.h"
#import "FVNavigationBar.h"
#import "VenuesPresenter.h"
#import "UIStoryboard+Links.h"

@implementation MenuViewController

- (instancetype)initWithPresenter:(MenuViewPresenter *)presenter
{
    self = [super init];
    if(self) {
        _presenter = presenter;
        [self setupViewControllers];
    }
    return self;
}

#pragma mark - working methods
- (void)setupViewControllers
{
    NSInteger count = [self.presenter numberOfItems];
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:count];
    for(NSUInteger i = 0; i < count; i++) {
        MenuItem *item = [self.presenter itemAtIndex:i];
        UIViewController *viewController = [UIStoryboard sceneNamed:item.storyboardIdentifier];
        if([viewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navControlller = (UINavigationController *)viewController;
            UIViewController *root = [navControlller.viewControllers firstObject];
            if([root respondsToSelector:@selector(setPresenter:)]) {
                id presenter = [[NSClassFromString(item.presenterClass) alloc]init];
                [root performSelector:@selector(setPresenter:) withObject:presenter];
            }
        }
        if(viewController) {
            viewController.tabBarItem.title = item.title;
            //viewController.tabBarItem.image = [UIImage imageNamed:item.imageName];
            //viewController.tabBarItem.selectedImage = [UIImage imageNamed:item.imageName];
            [viewControllers addObject:viewController];
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
