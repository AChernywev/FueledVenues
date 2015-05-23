//
//  IDPresenterChangeItemInsert.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PresenterChangeItemInsert.h"

@implementation PresenterChangeItemInsert

- (void)updateTableView:(UITableView *)tableView
{
    [tableView insertRowsAtIndexPaths:self.indexPaths
                     withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateCollectionView:(UICollectionView *)collectionView
{
    [collectionView insertItemsAtIndexPaths:self.indexPaths];
}

@end
