//
//  NSArray+Map.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 25/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "NSArray+Map.h"

@implementation NSArray (Map)

- (NSArray *)map:(id(^)(id object))convertBlock
{
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [mutArray addObject:convertBlock(obj)];
    }];
    return mutArray;
}
@end
