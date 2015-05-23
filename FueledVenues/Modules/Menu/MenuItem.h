//
//  MenuItem.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MenuItemType)
{
    MenuItemTypeVenues,
    MenuItemTypeFavorites,
    MenuItemTypeBlacklist
};

@interface MenuItem : NSObject
@property (nonatomic, readonly) NSString *imageName;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *storyboardIdentifier;

- (instancetype)initWithType:(MenuItemType)type;
@end
