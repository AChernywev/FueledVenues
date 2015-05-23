//
//  IDPresenterChangeReload.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PresenterChangeReload.h"

@implementation PresenterChangeReload

- (void)updateTableView:(UITableView*)tableView
{
    [tableView reloadData];
}

- (void)updateCollectionView:(UICollectionView *)collectionView
{
    [collectionView reloadData];
}

@end
