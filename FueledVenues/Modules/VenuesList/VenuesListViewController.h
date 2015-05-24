//
//  VenuesListViewController.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "TableViewController.h"

#import "VenuesPresenterInput.h"

@interface VenuesListViewController : TableViewController
@property (nonatomic, strong) id<VenuesPresenterInput> presenter;

- (instancetype)initWithPresenter:(id<VenuesPresenterInput>)presenter;
@end
