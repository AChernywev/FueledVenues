//
//  VenuesPresenterInput.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "CollectionPresenterProtocol.h"

@protocol VenuesPresenterInput <CollectionPresenterProtocol>

- (void)loadVenuesWithCompletion:(void(^)(NSError *error))completion;
@end
