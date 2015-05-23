//
//  MutableSectionsPresenter.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "SectionsPresenter.h"

#import "SectionItemProtocol.h"
#import "MutableCollectionProtocol.h"

@interface MutableSectionsPresenter : SectionsPresenter

- (instancetype)initWithSections:(id<MutableCollectionProtocol>)sections;
- (void)addSection:(id<SectionItemProtocol>)section;
- (void)insertSection:(id<SectionItemProtocol>)section atIndex:(NSUInteger)index;
- (void)removeLastSection;
- (void)removeSectionAtIndex:(NSUInteger)index;
- (void)replaceSectionAtIndex:(NSUInteger)index withSection:(id<SectionItemProtocol>)section;
@end
