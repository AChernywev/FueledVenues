//
//  MenuItem.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "MenuItem.h"

#import "Macroses.h"

@implementation MenuItem

#pragma mark - initialization
- (instancetype)initWithType:(MenuItemType)type
{
    self = [super init];
    if(self) {
        switch (type) {
            case MenuItemTypeVenues: {
                _imageName = nil;
                _title = LOC(@"tabbar.venuestitle");
                _storyboardIdentifier = @"Venues";
                _presenterClass = @"VenuesPresenter";
            }
                break;
            case MenuItemTypeFavorites: {
                _imageName = nil;
                _title = LOC(@"tabbar.favoritestitle");
                _storyboardIdentifier = @"Venues";
                
            }
                break;
            case MenuItemTypeBlacklist: {
                _imageName = nil;
                _title = LOC(@"tabbar.blacklisttitle");
                _storyboardIdentifier = @"Venues";
            }
                break;
                
            default: {
                NSAssert(NO, @"Unknown MenuItemType");
            }
                break;
        }
    }
    return self;
}

@end
