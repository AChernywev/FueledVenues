//
//  NSObject+Swizzle.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 29/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (void)swizzleSelector:(SEL)originalSelector onSelector:(SEL)swizzledSelector;
@end
