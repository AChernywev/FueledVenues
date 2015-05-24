//
//  VenuesListViewController.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenuesListViewController.h"

#import <SWTableViewCell/SWUtilityButtonView.h>

#import "Venue.h"
#import "VenueCell.h"
#import "Macroses.h"
#import "UIColor+FVColors.h"
#import "VenueDetailsViewController.h"

@implementation VenuesListViewController
@dynamic presenter;

#pragma mark - initialization
- (instancetype)initWithPresenter:(id<VenuesPresenterInput>)presenter
{
    self = [super initWithPresenter:presenter];
    return self;
}

#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"FUELED";
    self.view.backgroundColor = RGBColor(249, 244, 227);
    [self registerNibForCellClass:[VenueCell class] item:[Venue class] reuseIdentifier:kVenueCellReuseIdentifier];
    [self.presenter loadVenuesWithCompletion:^(NSError *error) {
        if(!error) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            VenueCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            [cell showRightUtilityButtonsAnimated:NO];
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
            [cell hideUtilityButtonsAnimated:YES];
            });
        }
    }];
}

- (CGFloat)rowHeightForItem:(id)item
{
    return 222;
}

- (void)configureCell:(UITableViewCell<ViewItemProtocol> *)customizeCell forItem:(id)item
{
    [super configureCell:customizeCell forItem:item];
    VenueCell *cell = (VenueCell *)customizeCell;
    cell.rightUtilityButtons = [self rightButtons];
    
    cell.delegate = self;
    
    [cell setNeedsLayout];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[VenueDetailsViewController class]]) {
        VenueDetailsViewController *detailsController = (VenueDetailsViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Venue *venue = [self.presenter itemAtIndexPath:indexPath];
        VenueDetailsPresenter *detailsPresenter = [[VenueDetailsPresenter alloc]initWithVenue:venue];
        detailsController.presenter = detailsPresenter;
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ShowVenueDetails" sender:self];
}


- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"More"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"Delete"];
    
    return rightUtilityButtons;
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    return YES;
}

@end
