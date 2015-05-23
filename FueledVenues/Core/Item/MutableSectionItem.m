//
//  MutableSectionItem.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "MutableSectionItem.h"

#import "SectionItem+Protected.h"

@interface MutableSectionItem()
@property (nonatomic, strong, readwrite) id<MutableCollectionProtocol> rows;

@end

@implementation MutableSectionItem
@dynamic rows;

#pragma mark - initialization
- (instancetype)initWithRows:(id<MutableCollectionProtocol>)rows
{
    self = [super initWithRows:rows];
    return self;
}

#pragma mark - public methods
- (void)updateRows:(id<MutableCollectionProtocol>)newRows
{
    [super updateRows:newRows];
}

#pragma mark - IDMutableCollectionProtocol
- (void)addObject:(id)anObject
{
    [self insertObject:anObject atIndex:self.count];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    index = MIN(index, self.count);
    if (anObject) {
        [self willChange:NSKeyValueChangeInsertion
         valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                  forKey:self.keyPath];
        [self.rows insertObject:anObject atIndex:index];
        [self didChange:NSKeyValueChangeInsertion
        valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                 forKey:self.keyPath];
    }
}

- (void)removeLastObject
{
    [self removeObjectAtIndex:self.count - 1];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        [self willChange:NSKeyValueChangeRemoval
         valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                  forKey:self.keyPath];
        [self.rows removeObjectAtIndex:index];
        [self didChange:NSKeyValueChangeRemoval
        valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                 forKey:self.keyPath];
    }
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (index < self.count && anObject) {
        [self willChange:NSKeyValueChangeReplacement
         valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                  forKey:self.keyPath];
        [self.rows replaceObjectAtIndex:index withObject:anObject];
        [self didChange:NSKeyValueChangeReplacement
        valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                 forKey:self.keyPath];
    }
    else if (anObject) {
        [self insertObject:anObject atIndex:index];
    }
}

@end
