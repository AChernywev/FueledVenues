//
//  MutableSectionsPresenter.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "MutableSectionsPresenter.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "SectionsPresenter+Protected.h"

@interface MutableSectionsPresenter()
@property (nonatomic, strong, readwrite) NSObject<MutableCollectionProtocol>* sections;

@end

@implementation MutableSectionsPresenter
@dynamic sections;

#pragma mark - initialization
- (instancetype)initWithSections:(id<MutableCollectionProtocol>)sections
{
    self = [super initWithSections:sections];
    return self;
}

#pragma mark - public methods
- (void)addSection:(id<SectionItemProtocol>)section
{
    [self insertSection:section atIndex:[self numberOfSections]];
}

- (void)insertSection:(id<SectionItemProtocol>)section atIndex:(NSUInteger)index
{
    index = MIN(index, [self numberOfSections]);
    if (section) {
        [self willChange:NSKeyValueChangeInsertion
         valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                  forKey:self.keyPath];
        [self.sections insertObject:section atIndex:index];
        [self didChange:NSKeyValueChangeInsertion
        valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                 forKey:self.keyPath];
    }
}

- (void)removeLastSection
{
    [self removeSectionAtIndex:[self numberOfSections] - 1];
}

- (void)removeSectionAtIndex:(NSUInteger)index
{
    if (index < [self numberOfSections]) {
        [self willChange:NSKeyValueChangeRemoval
         valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                  forKey:self.keyPath];
        [self.sections removeObjectAtIndex:index];
        [self didChange:NSKeyValueChangeRemoval
        valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                 forKey:self.keyPath];
    }
}

- (void)replaceSectionAtIndex:(NSUInteger)index withSection:(id<SectionItemProtocol>)section
{
    if (index < [self numberOfSections] && section) {
        [self willChange:NSKeyValueChangeReplacement
         valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                  forKey:self.keyPath];
        [self.sections replaceObjectAtIndex:index withObject:section];
        [self didChange:NSKeyValueChangeReplacement
        valuesAtIndexes:[NSIndexSet indexSetWithIndex:index]
                 forKey:self.keyPath];
    }
    else if (section) {
        [self insertSection:section atIndex:index];
    }
}

@end
