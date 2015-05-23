//
//  IDPresenterChangeSectionInsert.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PresenterChangeSectionInsert.h"

@implementation PresenterChangeSectionInsert

- (void)updateTableView:(UITableView *)tableView
{
    [tableView insertSections:self.indexSet
             withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateCollectionView:(UICollectionView *)collectionView
{
    [collectionView insertSections:self.indexSet];
}

@end
