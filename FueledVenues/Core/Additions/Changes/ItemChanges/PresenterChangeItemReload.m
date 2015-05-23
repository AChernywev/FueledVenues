//
//  IDPresenterChangeItemReload.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PresenterChangeItemReload.h"

@implementation PresenterChangeItemReload

- (void)updateTableView:(UITableView *)tableView
{
    [tableView reloadRowsAtIndexPaths:self.indexPaths
                     withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateCollectionView:(UICollectionView *)collectionView
{
    [collectionView reloadItemsAtIndexPaths:self.indexPaths];
}

@end
