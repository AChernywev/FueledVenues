//
//  BaseEntity.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity.h"

@implementation BaseEntity

- (instancetype)initWithIdentifier:(NSString *)identifier
{
    self = [super init];
    if(self) {
        _identifier = identifier;
    }
    return self;
}

@end
