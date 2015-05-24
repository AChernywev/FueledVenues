//
//  MenuViewPresenter.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "MenuViewPresenter.h"

@interface MenuViewPresenter()
@property (nonatomic, strong) NSArray *items;

@end

@implementation MenuViewPresenter

- (instancetype)init
{
    self = [super init];
    if(self) {
        _items = @[
                   [[MenuItem alloc]initWithType:MenuItemTypeVenues],
                   [[MenuItem alloc]initWithType:MenuItemTypeFavorites],
                   [[MenuItem alloc]initWithType:MenuItemTypeBlacklist]
                   ];
    }
    return self;
}

- (NSInteger)numberOfItems
{
    return self.items.count;
}

- (MenuItem *)itemAtIndex:(NSUInteger)index
{
    return [self.items objectAtIndex:index];
}
@end
