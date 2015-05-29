//
//  TableViewController.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "TableViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "PresenterChange.h"
#import "ViewItemProtocol.h"

const CGFloat kDynamicRowHeight = -1;

@interface TableViewController()
@property (nonatomic, strong) NSMutableDictionary* prototypes;

@end

@implementation TableViewController
@synthesize reuseIdentifierMatcher = _reuseIdentifierMatcher;

+ (UITableViewStyle)tableViewStyle
{
    return UITableViewStylePlain;
}

#pragma mark - initialization
- (instancetype)initWithPresenter:(id<CollectionPresenterProtocol>)presenter
{
    self = [super initWithStyle:[[self class]tableViewStyle]];
    if (self) {
        _presenter = presenter;
    }
    return self;
}

#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.prototypes = [@{} mutableCopy];

    //self.tableView.estimatedRowHeight = 50;
    RACSignal* changes = [RACObserve(self, presenter.changes) switchToLatest];
    [self rac_liftSelector:@selector(handleChange:) withSignals:changes, nil];
}

- (void)handleChange:(id<PresenterChange>)change
{
    if (self.isViewLoaded)
        [change updateTableView:self.tableView];
}

#pragma mark - public methods
- (void)registerCellClass:(Class)cellClass
                  fotItem:(Class)itemClass
          reuseIdentifier:(NSString*)reuseIdentifier
{
    if (reuseIdentifier.length > 0) {
        [self.tableView registerClass:cellClass forCellReuseIdentifier:reuseIdentifier];
        [self.reuseIdentifierMatcher registerReuseIdentifier:reuseIdentifier forItemClass:itemClass];
    }
}

- (void)registerNibForCellClass:(Class)cellClass
                           item:(Class)itemClass
                reuseIdentifier:(NSString*)reuseIdentifier
{
    UINib* nib = [UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil];
    if (nib && reuseIdentifier.length > 0) {
        [self.tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
        [self.prototypes setObject:[nib instantiateWithOwner:nil options:nil].firstObject forKey:reuseIdentifier];
        [self.reuseIdentifierMatcher registerReuseIdentifier:reuseIdentifier forItemClass:itemClass];
    }
}

- (void)configureCell:(UITableViewCell<ViewItemProtocol>*)cell
              forItem:(id)item
{
    cell.item = item;
}

- (void)configureHeaderFooter:(UITableViewHeaderFooterView <ViewItemProtocol>*)view
                      forItem:(id<HeaderFooterItemProtocol>)item
{
    view.item = item;
}

- (CGFloat)rowHeightForItem:(id)item
{
    return self.tableView.rowHeight;
}

- (CGFloat)headerFooterHeightForItem:(id)item
{
    NSString* reuseIdentifier = [self.reuseIdentifierMatcher reuseIdentifierForItem:item];
    UIView<HeaderFooterItemProtocol>* view = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
    return view.bounds.size.height;
}

#pragma mark - setters/getters
- (void)setPresenter:(id<CollectionPresenterProtocol>)presenter
{
    _presenter = presenter;
    if (self.isViewLoaded)
        [self.tableView reloadData];
}

- (ReuseIdentifierMatcher *)reuseIdentifierMatcher
{
    if (!_reuseIdentifierMatcher) {
        _reuseIdentifierMatcher = [ReuseIdentifierMatcher new];
    }
    return _reuseIdentifierMatcher;
}

#pragma mark - UITableViewDataSource header/footer
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ([self.presenter respondsToSelector:@selector(itemForHeaderInSection:)]) {
        if([self.presenter itemForHeaderInSection:section].hasView) {
            return nil;
        }
        else {
            return [self.presenter itemForHeaderInSection:section].title;
        }
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if ([self.presenter respondsToSelector:@selector(itemForFooterInSection:)]) {
        if([self.presenter itemForFooterInSection:section].hasView) {
            return nil;
        }
        else {
            return [self.presenter itemForFooterInSection:section].title;
        }
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([self.presenter respondsToSelector:@selector(itemForHeaderInSection:)]) {
        id<HeaderFooterItemProtocol> item = [self.presenter itemForHeaderInSection:section];
        if (item.hasView) {
            NSString* reuseIdentifier = [self.reuseIdentifierMatcher reuseIdentifierForItem:item];
            UITableViewHeaderFooterView<ViewItemProtocol>* view = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
            [self configureHeaderFooter:view forItem:item];
            return view;
        }
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self.presenter respondsToSelector:@selector(itemForHeaderInSection:)]) {
        id<HeaderFooterItemProtocol> item = [self.presenter itemForHeaderInSection:section];
        if (item.hasView) {
            return [self headerFooterHeightForItem:item];
        }
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if ([self.presenter respondsToSelector:@selector(itemForFooterInSection:)]) {
        id<HeaderFooterItemProtocol> item = [self.presenter itemForFooterInSection:section];
        if (item.hasView) {
            NSString* reuseIdentifier = [self.reuseIdentifierMatcher reuseIdentifierForItem:item];
            UITableViewHeaderFooterView<ViewItemProtocol>* view = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
            [self configureHeaderFooter:view forItem:item];
            return view;
        }
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if ([self.presenter respondsToSelector:@selector(itemForFooterInSection:)]) {
        id<HeaderFooterItemProtocol> item = [self.presenter itemForFooterInSection:section];
        if (item.hasView) {
            return [self headerFooterHeightForItem:item];
        }
    }
    return 0;
}

#pragma mark - UITableViewDataSource cells
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.presenter numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.presenter numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self.presenter itemAtIndexPath:indexPath];
    NSString *reuseIdentifier = [self.reuseIdentifierMatcher reuseIdentifierForItem:item];
    UITableViewCell<ViewItemProtocol>* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier
                                                                        forIndexPath:indexPath];
    [self configureCell:cell forItem:item];
    return cell;
}

-    (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self.presenter itemAtIndexPath:indexPath];
    CGFloat height = [self rowHeightForItem:item];
    if (height == kDynamicRowHeight) {
        NSString *reuseIdentifier = [self.reuseIdentifierMatcher reuseIdentifierForItem:item];
        UITableViewCell<ViewItemProtocol>* cell = self.prototypes[reuseIdentifier];
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier
                                                   forIndexPath:indexPath];
        }
        [cell prepareForReuse];
        [self configureCell:cell forItem:item];
        height = ceil([cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height);
    }
    return height;
}

-       (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.presenter respondsToSelector:@selector(didSelectItemAtIndexPath:completion:)]) {
        [self.presenter didSelectItemAtIndexPath:indexPath completion:^{
            //[tableView deselectAllRowsAnimated:YES];
        }];
    }
}

#pragma mark - UIViewController methods
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
