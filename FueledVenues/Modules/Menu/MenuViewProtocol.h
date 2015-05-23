//
//  MenuViewProtocol.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MenuItem;

@protocol MenuViewProtocol <NSObject>

- (void)openMenuAnimated:(BOOL)animated;
- (void)closeMenuAnimated:(BOOL)animated;
- (void)openMenuItem:(MenuItem *)item closeMenu:(BOOL)closeMenu animated:(BOOL)animated;
@end
