//
//  IDPresenterChange.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PresenterChange <NSObject>

- (void)updateTableView:(UITableView*)tableView;
- (void)updateCollectionView:(UICollectionView*)collectionView;

@end

@protocol PresenterChangeSection <PresenterChange>

- (instancetype)initWithIndex:(NSUInteger)index;
- (instancetype)initWithIndexSet:(NSIndexSet*)indexSet;

@end

@protocol PresenterChangeItem <PresenterChange>

- (instancetype)initWithIndexPath:(NSIndexPath*)indexPath;
- (instancetype)initWithIndexPaths:(NSArray*)indexPaths;

@end
