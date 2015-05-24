//
//  UIFont+FVStyles.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "UIView+FVStyles.h"

#import <objc/runtime.h>

@implementation UIView (FVStyles)

#pragma mark - class loading methods
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSelector:@selector(initWithFrame:) onSelector:@selector(xxx_initWithFrame:)];
        [self swizzleSelector:@selector(awakeFromNib) onSelector:@selector(xxx_awakeFromNib)];
    });
}

#pragma mark - working class method
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

#pragma mark - initialization
- (instancetype)xxx_initWithFrame:(CGRect)frame
{
    id result = [self xxx_initWithFrame:frame];
    [result setupAppearence];
    return result;
}

- (void)xxx_awakeFromNib
{
    [self xxx_awakeFromNib];
    [self setupAppearence];
}

- (void)setupAppearence
{
}

@end
