//
//  PlaceholderTableView.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PlaceholderTableView.h"

@implementation PlaceholderTableView

#pragma mark -lifecycle
- (void)awakeFromNib
{
    [super awakeFromNib];
}

#pragma mark - reload methods
- (void)insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [super insertSections:sections withRowAnimation:animation];
    [self checkPlaceholderViewAppearenceAnimated:YES];
}

- (void)deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [super deleteSections:sections withRowAnimation:animation];
    [self checkPlaceholderViewAppearenceAnimated:YES];
}

- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [super reloadSections:sections withRowAnimation:animation];
    [self checkPlaceholderViewAppearenceAnimated:YES];
}

- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [super insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self checkPlaceholderViewAppearenceAnimated:YES];
}

- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [super deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self checkPlaceholderViewAppearenceAnimated:YES];
}

- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [super reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self checkPlaceholderViewAppearenceAnimated:YES];
}

- (void)reloadData
{
    [super reloadData];
    [self checkPlaceholderViewAppearenceAnimated:NO];
}

#pragma mark - working methods
- (void)checkPlaceholderViewAppearenceAnimated:(BOOL)animated
{
    NSInteger numOfRows = 0;
    for(NSInteger section = 0; section < self.numberOfSections; section++) {
        numOfRows += [self numberOfRowsInSection:section];
    }
    
    if(!numOfRows && !self.placeholderView.superview) {
        self.placeholderView.alpha = 0.0f;
        [self addSubview:self.placeholderView];
    }
    [UIView animateWithDuration:animated ? 0.25 : 0
                     animations:^{
                         self.placeholderView.alpha = (numOfRows == 0);
                     }
                     completion:^(BOOL finished) {
                         if(numOfRows) {
                            [self.placeholderView removeFromSuperview];
                         }
                     }
     ];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.placeholderView.frame = self.bounds;
    [self bringSubviewToFront:self.placeholderView];
}
@end
