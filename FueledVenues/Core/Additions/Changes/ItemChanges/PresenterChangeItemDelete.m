//
//  IDPresenterChangeItemDelete.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PresenterChangeItemDelete.h"

@implementation PresenterChangeItemDelete

- (void)updateTableView:(UITableView *)tableView
{
    [tableView deleteRowsAtIndexPaths:self.indexPaths
                     withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateCollectionView:(UICollectionView *)collectionView
{
    [collectionView deleteItemsAtIndexPaths:self.indexPaths];
}

@end
