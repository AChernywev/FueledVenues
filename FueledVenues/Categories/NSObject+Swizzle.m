//
//  NSObject+Swizzle.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 29/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "NSObject+Swizzle.h"

#import <objc/runtime.h>

@implementation NSObject (Swizzle)

+ (void)swizzleSelector:(SEL)originalSelector onSelector:(SEL)swizzledSelector
{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
