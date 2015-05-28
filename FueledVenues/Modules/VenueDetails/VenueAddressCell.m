//
//  VenueAddressCell.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenueAddressCell.h"

#import "Macroses.h"
#import "UIColor+FVColors.h"

NSString * kVenueAddressCellReuseIdentifier = @"VenueAddressCellReuseIdentifier";

@interface VenueAddressCell ()
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;

@end

@implementation VenueAddressCell

#pragma mark - lifecycle
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //UIView *view = [[UIView alloc] initWithFrame:self.frame];
    //view.backgroundColor = RGBAColor(234, 228, 208, 1.0);
    //self.selectedBackgroundView = view;
}

#pragma mark - public methods
- (void)setItem:(id)item
{
    [super setItem:item];
    self.addressLabel.text = item;
}

#pragma mark - UITableViewCell methods
- (void)prepareForReuse
{
    [super prepareForReuse];
    self.addressLabel.text = nil;
}
@end
