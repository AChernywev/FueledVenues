//
//  MutableSectionItem.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//


#import "SectionItem.h"
#import "NSMutableArray+MutableCollection.h"

@interface MutableSectionItem : SectionItem <MutableCollectionProtocol>

- (instancetype)initWithRows:(id<MutableCollectionProtocol>)rows;
- (void)updateRows:(id<MutableCollectionProtocol>)newRows;
@end
