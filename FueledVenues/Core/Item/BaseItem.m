//
//  BaseItem.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseItem.h"

#import "BaseItem_Protected.h"

@implementation BaseItem

- (instancetype)initWithObject:(id)object
{
    self = [super init];
    if(self) {
        _object = object;
    }
    return self;
}

@end
