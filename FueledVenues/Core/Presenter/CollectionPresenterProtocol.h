//
//  CollectionPresenterProtocol.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "HeaderFooterItemProtocol.h"

@class RACSignal;

@protocol CollectionPresenterProtocol <NSObject>

@required
- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfItemsInSection:(NSUInteger)section;
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@optional
@property (nonatomic, readonly, strong) RACSignal *changes;

- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath
                      completion:(dispatch_block_t)completion;
- (id<HeaderFooterItemProtocol>)itemForHeaderInSection:(NSUInteger)section;
- (id<HeaderFooterItemProtocol>)itemForFooterInSection:(NSUInteger)section;
@end
