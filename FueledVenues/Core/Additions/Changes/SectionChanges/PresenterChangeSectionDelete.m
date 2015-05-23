//
//  IDPresenterChangeSectionDelete.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PresenterChangeSectionDelete.h"

@implementation PresenterChangeSectionDelete

- (void)updateTableView:(UITableView *)tableView
{
    [tableView deleteSections:self.indexSet
             withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateCollectionView:(UICollectionView *)collectionView
{
    [collectionView deleteSections:self.indexSet];
}

@end
