//
//  SectionPresenter.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "CollectionPresenterProtocol.h"

#import "SectionItem.h"

@interface SectionsPresenter : NSObject <CollectionPresenterProtocol>

//All elements of sections array should be of SectionItem class.
- (instancetype)initWithSections:(id<CollectionProtocol>)sections;

- (void)updateSections:(id<CollectionProtocol>)newSections;
- (void)insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath;
- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath;
@end
