//
//  TableViewController.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CollectionPresenterProtocol.h"
#import "ReuseIdentifierMatcher.h"
#import "ViewItemProtocol.h"

extern const CGFloat kDynamicRowHeight;

@interface TableViewController : UITableViewController

@property (nonatomic, strong) id<CollectionPresenterProtocol> presenter;
@property (nonatomic, strong, readonly) ReuseIdentifierMatcher* reuseIdentifierMatcher;

+ (UITableViewStyle)tableViewStyle;

- (instancetype)initWithPresenter:(id<CollectionPresenterProtocol>)presenter;

- (void)registerCellClass:(Class)cellClass
                  fotItem:(Class)itemClass
          reuseIdentifier:(NSString*)reuseIdentifier;
- (void)registerNibForCellClass:(Class)cellClass
                           item:(Class)itemClass
                reuseIdentifier:(NSString*)reuseIdentifier;

//needs to call super
- (void)configureHeaderFooter:(UITableViewHeaderFooterView <ViewItemProtocol>*)view
                      forItem:(id<HeaderFooterItemProtocol>)item;
- (void)configureCell:(UITableViewCell<ViewItemProtocol>*)cell
              forItem:(id)item;

- (CGFloat)rowHeightForItem:(id)item;
- (CGFloat)headerFooterHeightForItem:(id<HeaderFooterItemProtocol>)item;
@end
