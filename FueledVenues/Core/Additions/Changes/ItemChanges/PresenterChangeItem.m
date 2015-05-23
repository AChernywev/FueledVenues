//
//  IDPresenterChangeItem.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PresenterChangeItem.h"

@implementation PresenterChangeItem

- (id)initWithIndexPath:(NSIndexPath *)indexPath
{
    return [self initWithIndexPaths:@[indexPath]];
}

- (id)initWithIndexPaths:(NSArray *)indexPaths
{
    self = [super init];
    if (self) {
        _indexPaths = indexPaths;
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
