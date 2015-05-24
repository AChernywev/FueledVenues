//
//  MenuViewPresenter.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "MenuItem.h"

@interface MenuViewPresenter : NSObject

- (NSInteger)numberOfItems;
- (MenuItem *)itemAtIndex:(NSUInteger)index;
@end
