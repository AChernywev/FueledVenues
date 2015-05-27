//
//  ServiceLayer.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenuesService.h"

@interface ServiceLayer : NSObject
@property (nonatomic, readonly) VenuesService *venueService;

+ (instancetype)sharedDataProvider;
@end
