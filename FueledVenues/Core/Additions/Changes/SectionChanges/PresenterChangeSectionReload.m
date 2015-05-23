//
//  IDPresenterChangeSectionReload.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PresenterChangeSectionReload.h"

@implementation PresenterChangeSectionReload

- (void)updateTableView:(UITableView *)tableView
{
    [tableView reloadSections:self.indexSet
             withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateCollectionView:(UICollectionView *)collectionView
{
    [collectionView reloadSections:self.indexSet];
}

@end
