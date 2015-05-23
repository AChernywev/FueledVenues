//
//  IDPresenterChangeSection.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PresenterChangeSection.h"

@implementation PresenterChangeSection

- (instancetype)initWithIndex:(NSUInteger)index
{
    return [self initWithIndexSet:[NSIndexSet indexSetWithIndex:index]];
}

- (instancetype)initWithIndexSet:(NSIndexSet *)indexSet
{
    self = [super init];
    if (self) {
        _indexSet = indexSet;
    }
    return self;
}

- (void)updateTableView:(UITableView *)tableView
{
    return;
}

- (void)updateCollectionView:(UICollectionView *)collectionView
{
    return;
}

@end
