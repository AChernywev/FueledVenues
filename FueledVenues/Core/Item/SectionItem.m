//
//  SectionItem.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "SectionItem.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "SectionItem+Protected.h"

@implementation SectionItem
@synthesize headerItem = _headerItem;
@synthesize footerItem = _footerItem;
@synthesize changes = _changes;

#pragma mark - initialization
- (instancetype)init
{
    return [self initWithRows:nil];
}

- (instancetype)initWithRows:(id<CollectionProtocol>)rows
{
    self = [super init];
    if (self) {
        self.rows = rows;
        RACSignal* kvo = [self rac_valuesAndChangesForKeyPath:self.keyPath
                                                      options:0
                                                     observer:self];
        _changes = [kvo map:^RACTuple*(RACTuple* tuple) {
            return [RACTuple tupleWithObjects:tuple.first, tuple.second, self, nil];
        }];
    }
    return self;
}

#pragma mark - public methods
- (void)updateRows:(id<CollectionProtocol>)newRows
{
    self.rows = newRows;
}

#pragma mark - <CollectionProtocol> methods
- (NSUInteger)count
{
    return self.rows.count;
}

- (id)objectAtIndex:(NSUInteger)index
{
    return index < self.count ? [self.rows objectAtIndex:index] : nil;
}

- (NSUInteger)indexOfObject:(id)anObject
{
    return [self.rows indexOfObject:anObject];
}


@end
