//
//  VenueDetailsViewController.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenueDetailsViewController.h"

#import "Macroses.h"
#import "VenueCell.h"
#import "VenueButtonsCell.h"
#import "VenueAddressCell.h"
#import "VenueContactItem.h"
#import "ReviewsTableViewController.h"
#import "UIColor+FVColors.h"
#import "VenueMapViewController.h"

@implementation VenueDetailsViewController
@dynamic presenter;

#pragma mark - initialization
- (instancetype)initWithPresenter:(VenueDetailsPresenter *)presenter
{
    self = [super initWithPresenter:presenter];
    return self;
}

#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.presenter.venue.name;
    self.view.backgroundColor = [UIColor viewBackgroundColor];
    
    [self registerNibForCellClass:[VenueCell class] item:[Venue class] reuseIdentifier:kVenueCellReuseIdentifier];
    [self registerNibForCellClass:[VenueButtonsCell class] item:[VenueContactItem class] reuseIdentifier:kVenueButtonsCellReuseIdentifier];
    [self registerNibForCellClass:[VenueAddressCell class] item:[NSString class] reuseIdentifier:kVenueAddressCellReuseIdentifier];
    [self.presenter updateInfo];
}

#pragma mark - superclass methods
- (CGFloat)rowHeightForItem:(id)item
{
    return kDynamicRowHeight;
}

- (void)configureCell:(UITableViewCell<ViewItemProtocol> *)cell forItem:(id)item
{
    [super configureCell:cell forItem:item];
    if([item isKindOfClass:[VenueContactItem class]]) {
        VenueButtonsCell *buttonsCell = (VenueButtonsCell *)cell;
        buttonsCell.delegate = (id<VenueButtonsCellDelegate>)self;
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Aasd; ka;sdka;sdk a;d");
}

#pragma mark - <VenueButtonsCellDelegate> methods
- (void)venueButtonsCellDidSelectMenu:(VenueButtonsCell *)cell
{
    if([[UIApplication sharedApplication] canOpenURL:((VenueContactItem *)cell.item).menuURL]) {
        [[UIApplication sharedApplication] openURL:((VenueContactItem *)cell.item).menuURL];
    }
}

- (void)venueButtonsCellDidSelectReviews:(VenueButtonsCell *)cell
{
    [self performSegueWithIdentifier:@"ShowReviews" sender:cell];
}

- (void)venueButtonsCellDidSelectCall:(VenueButtonsCell *)cell
{
    if([[UIApplication sharedApplication] canOpenURL:((VenueContactItem *)cell.item).phoneURL]) {
        [[UIApplication sharedApplication] openURL:((VenueContactItem *)cell.item).phoneURL];
    }
}

- (void)venueButtonsCellDidSelectWeb:(VenueButtonsCell *)cell
{
    if([[UIApplication sharedApplication] canOpenURL:((VenueContactItem *)cell.item).websiteURL]) {
        [[UIApplication sharedApplication] openURL:((VenueContactItem *)cell.item).websiteURL];
    }
}

#pragma mark - Segues transitions
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[ReviewsTableViewController class]]) {
        ReviewsTableViewController *detailsController = (ReviewsTableViewController *)segue.destinationViewController;
        VenueButtonsCell *cell = (VenueButtonsCell *)sender;
        ReviewsViewPresenter *reviewsPresenter = [[ReviewsViewPresenter alloc]initWithVenueIdentifier:((VenueContactItem *)cell.item).venueIdentifier];
        detailsController.presenter = reviewsPresenter;
    }
    else if([segue.destinationViewController isKindOfClass:[VenueMapViewController class]]) {
        VenueMapViewController *mapController = (VenueMapViewController *)segue.destinationViewController;
        mapController.venues = @[self.presenter.venue];
    }
}

@end
