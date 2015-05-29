//
//  SectionPresenter.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "SectionsPresenter.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "SectionItemProtocol.h"
#import "MutableCollectionProtocol.h"
#import "SectionsPresenter+Protected.h"

#import "PresenterChangeReload.h"
#import "PresenterChangeSectionInsert.h"
#import "PresenterChangeSectionDelete.h"
#import "PresenterChangeSectionReload.h"

#import "PresenterChangeItemDelete.h"
#import "PresenterChangeItemInsert.h"
#import "PresenterChangeItemReload.h"

@interface SectionsPresenter ()
@property (nonatomic, strong, readwrite) RACSignal* sectionItemsSignal;

@end

@implementation SectionsPresenter
@synthesize changes = _changes;

#pragma mark - initialization
- (instancetype)init
{
    return [self initWithSections:nil];
}

- (instancetype)initWithSections:(id<CollectionProtocol>)sections
{
    self = [super init];
    if (self) {
        _sections = sections;
        RACSignal* kvo = [self rac_valuesAndChangesForKeyPath:self.keyPath
                                                      options:0
                                                     observer:self];
        RACSignal* sectionsSignal = [kvo map:^id<PresenterChange>(RACTuple* tuple)
                                     {
                                         NSDictionary* observation = tuple.second;
                                         NSIndexSet* indexes = observation[NSKeyValueChangeIndexesKey];
                                         NSKeyValueChange kind = [observation[NSKeyValueChangeKindKey] unsignedIntegerValue];
                                         switch (kind) {
                                             case NSKeyValueChangeSetting:
                                                 return [[PresenterChangeReload alloc] init];
                                             case NSKeyValueChangeInsertion:
                                                 return [[PresenterChangeSectionInsert alloc] initWithIndexSet:indexes];
                                             case NSKeyValueChangeRemoval:
                                                 return [[PresenterChangeSectionDelete alloc] initWithIndexSet:indexes];
                                             case NSKeyValueChangeReplacement:
                                                 return [[PresenterChangeSectionReload alloc] initWithIndexSet:indexes];
                                         }
                                     }];
        [self rac_liftSelector:@selector(configureSectionItemsWithUpdates:) withSignals:kvo, nil];
        _changes = [RACSignal merge:@[[RACObserve(self, sectionItemsSignal) switchToLatest], sectionsSignal]];
    }
    return self;
}

#pragma mark - public methods
- (void)updateSections:(id<CollectionProtocol>)newSections
{
    self.sections = newSections;
}

- (void)insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    if ([self canWorkWithSection:indexPath.section]) {
        id<MutableCollectionProtocol>section = (id<MutableCollectionProtocol>)[self sectionAtIndex:indexPath.section];
        [section insertObject:item atIndex:indexPath.item];
    }
}

- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self canWorkWithSection:indexPath.section]) {
        id<MutableCollectionProtocol>section = (id<MutableCollectionProtocol>)[self sectionAtIndex:indexPath.section];
        [section removeObjectAtIndex:indexPath.item];
    }
}

#pragma mark - private methods
- (BOOL)canWorkWithSection:(NSInteger)sectionIndex
{
    id<MutableCollectionProtocol>section = (id<MutableCollectionProtocol>)[self sectionAtIndex:sectionIndex];
    return section && [section conformsToProtocol:@protocol(MutableCollectionProtocol)];
}

- (id<SectionItemProtocol>)sectionAtIndex:(NSUInteger)index
{
    return index < self.sections.count ? [self.sections objectAtIndex:index] : nil;
}

- (void)configureSectionItemsWithUpdates:(id)sectionsUpdates
{
    NSMutableArray* sectionChanges = [NSMutableArray arrayWithCapacity:self.sections.count];
    for (NSUInteger index = 0; index < self.sections.count; index++) {
        id<SectionItemProtocol> section = [self.sections objectAtIndex:index];
        if ([section respondsToSelector:@selector(changes)]) {
            [sectionChanges addObject:section.changes];
        }
    }
    self.sectionItemsSignal = [[RACSignal merge:sectionChanges] map:^id<PresenterChange>(RACTuple* tuple) {
        NSDictionary* observation = tuple.second;
        NSIndexSet* indexes = observation[NSKeyValueChangeIndexesKey];
        NSMutableArray* indexPaths = [NSMutableArray arrayWithCapacity:indexes.count];
        NSUInteger sectionIndex = [self.sections indexOfObject:tuple.third];
        if (sectionIndex != NSNotFound) {
            [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                [indexPaths addObject:[NSIndexPath indexPathForItem:idx inSection:sectionIndex]];
            }];
            NSKeyValueChange kind = [observation[NSKeyValueChangeKindKey] unsignedIntegerValue];
            switch (kind) {
                case NSKeyValueChangeSetting:
                    return [[PresenterChangeSectionReload alloc] initWithIndex:sectionIndex];
                case NSKeyValueChangeInsertion:
                    return [[PresenterChangeItemInsert alloc] initWithIndexPaths:indexPaths];
                case NSKeyValueChangeRemoval:
                    return [[PresenterChangeItemDelete alloc] initWithIndexPaths:indexPaths];
                case NSKeyValueChangeReplacement:
                    return [[PresenterChangeItemReload alloc] initWithIndexPaths:indexPaths];
            }
        }
        return nil;
    }];
}

#pragma mark - CollectionPresenterProtocol
- (NSUInteger)numberOfSections
{
    return self.sections.count;
}

- (NSUInteger)numberOfItemsInSection:(NSUInteger)index
{
    return [self sectionAtIndex:index].count;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self sectionAtIndex:indexPath.section] objectAtIndex:indexPath.item];
}

- (id<HeaderFooterItemProtocol>)itemForHeaderInSection:(NSUInteger)section
{
    id<SectionItemProtocol>sectionItem = [self sectionAtIndex:section];
    if([sectionItem respondsToSelector:@selector(headerItem)]) {
        return [sectionItem headerItem];
    }
    else {
        return nil;
    }
}

- (id<HeaderFooterItemProtocol>)itemForFooterInSection:(NSUInteger)section
{
    id<SectionItemProtocol>sectionItem = [self sectionAtIndex:section];
    if([sectionItem respondsToSelector:@selector(footerItem)]) {
        return [sectionItem footerItem];
    }
    else {
        return nil;
    }
}

@end
