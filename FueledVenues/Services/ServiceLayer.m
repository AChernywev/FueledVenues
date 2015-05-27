//
//  ServiceLayer.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "ServiceLayer.h"

@implementation ServiceLayer

#pragma mark - singleton methods
+ (instancetype)sharedDataProvider
{
    static ServiceLayer *serviceLayerInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        serviceLayerInstance = [ServiceLayer new];
    });
    return serviceLayerInstance;
}

#pragma mark - initialization
- (instancetype)init
{
    self = [super init];
    if(self) {
        _venueService = [VenuesService new];
    }
    return self;
}
@end
