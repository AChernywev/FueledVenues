//
//  VenuesPresenter.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "MutableSectionsPresenter.h"

@interface VenuesPresenter : MutableSectionsPresenter
@property (nonatomic, readonly) NSArray *venues;

- (void)loadVenuesWithCompletion:(void(^)(NSError *error))completion;
- (void)handleRightUtiltyEventWithInex:(NSInteger)index atIndexPath:(NSIndexPath *)indexPath;
@end
