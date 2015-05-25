//
//  BaseEntity.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity.h"

@implementation BaseEntity

#pragma mark - initialization
- (instancetype)initWithIdentifier:(EntityIDType)identifier
{
    self = [super init];
    if (self) {
        _identifier = identifier;
    }
    return self;
}

@end
