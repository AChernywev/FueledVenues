//
//  FoursquareAPI.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 24/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "FoursquareAPI.h"

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>

#import "Venue.h"

static NSString * const kClientID               = @"CEUCXQN4ZTCXM51C2MCTPSPK4JK4IOQMGGTDLSDA0DOMHFST";
static NSString * const kClientSecret           = @"ZEYHAQIABXIRDUJKVNPYXDZRDB0BMVYOZKILQWYA41FKBB1I";
static CGFloat    const kFueledOfficeLatitude   = 40.7242727;
static CGFloat    const kFueledOfficeLongitude  = -73.9975018;
static NSInteger  const kNumberOfVenuesLimit    = 50;

@implementation FoursquareAPI

- (void)loadClosestVenuesWithCompletion:(void(^)(NSArray *venues, NSError *error))completion
{
    NSDictionary *params = @{@"ll"              : [NSString stringWithFormat:@"%f, %f", kFueledOfficeLatitude, kFueledOfficeLongitude],
                             @"offset"          : @(0),
                             @"limit"           : @(kNumberOfVenuesLimit),
                             @"section"         : @"food",
                             @"time"            : @"any",
                             @"day"             : @"any",
                             @"venuePhotos"     : @1,
                             @"openNow"         : @1,
                             @"sortByDistance"  : @1,
                             @"client_id"       : kClientID,
                             @"client_secret"   : kClientSecret,
                             @"v"               : @"20150524",
                             };
    
    [[AFHTTPSessionManager manager] GET:@"https://api.foursquare.com/v2/venues/explore"
                             parameters:params
                                success:^(NSURLSessionDataTask *task, id responseObject) {
                                    NSArray *venues = [Venue venuesArrayFromResponse: responseObject];
                                    if(completion) {
                                        completion(venues, nil);
                                    }
                                }
                                failure:^(NSURLSessionDataTask *task, NSError *error) {
                                    if(completion) {
                                        completion(nil, error);
                                    }
                                }
     ];
}
@end
