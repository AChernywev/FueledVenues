//
//  NSDateFormatter+Singleton.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "NSDateFormatter+Singleton.h"

@implementation NSDateFormatter (Singleton)

+ (instancetype)sharedFormatter;
{
    static id sharedInstace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstace = [[[self class] alloc]init];
    });
    return sharedInstace;
}

@end
