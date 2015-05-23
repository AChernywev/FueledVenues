//
//  MenuItem.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

#pragma mark - initialization
- (instancetype)initWithType:(MenuItemType)type
{
    self = [super init];
    if(self) {
        switch (type) {
            case MenuItemTypeVenues: {
                _imageName = nil;
                _title = @"Venues";
                _storyboardIdentifier = @"Auth";
            }
                break;
            case MenuItemTypeFavorites: {
                _imageName = nil;
                _title = @"Favorites";
                _storyboardIdentifier = @"Profile";
                
            }
                break;
            case MenuItemTypeBlacklist: {
                _imageName = nil;
                _title = @"Blacklist";
                _storyboardIdentifier = @"Auth";
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
