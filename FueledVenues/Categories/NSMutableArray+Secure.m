//
//  NSArray+Secure.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 25/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "NSMutableArray+Secure.h"

@implementation NSMutableArray (Secure)

- (void)addObjectSecure:(id)anObject
{
    if(anObject) {
        [self addObject:anObject];
    }
}

@end
