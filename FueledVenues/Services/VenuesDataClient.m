//
//  VenuesDataClient.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenuesDataClient.h"

#import "APIService.h"
#import "NSDateFormatter+Singleton.h"
#import "Venue+Parsing.h"
#import "Review+Parsing.h"

static NSString * const kClientID               = @"CEUCXQN4ZTCXM51C2MCTPSPK4JK4IOQMGGTDLSDA0DOMHFST";
static NSString * const kClientSecret           = @"ZEYHAQIABXIRDUJKVNPYXDZRDB0BMVYOZKILQWYA41FKBB1I";
static CGFloat    const kFueledOfficeLatitude   = 40.7242727;
static CGFloat    const kFueledOfficeLongitude  = -73.9975018;

@interface VenuesDataClient()
@property (nonatomic, readonly) APIService *apiService;

@end

@implementation VenuesDataClient

#pragma mark - initialization
- (instancetype)init
{
    self = [super init];
    if(self) {
        _apiService = [[APIService alloc]initWithBaseURL:@"https://api.foursquare.com/v2/venues/"];
    }
    return self;
}

#pragma mark - public methods
- (void)loadVenuesWithCount:(NSInteger)count
                 completion:(void(^)(NSArray *venues, NSError *error))completion
{
    NSDictionary *params = @{@"ll"              : [NSString stringWithFormat:@"%f, %f", kFueledOfficeLatitude, kFueledOfficeLongitude],
                             @"offset"          : @(0),
                             @"limit"           : @(count),
                             @"section"         : @"food",
                             @"time"            : @"any",
                             @"day"             : @"any",
                             @"price"           : @"1,2,3,4",
                             @"venuePhotos"     : @1,
                             @"openNow"         : @1,
                             @"sortByDistance"  : @1
                             };
    NSMutableDictionary *combinedParams = [[NSMutableDictionary alloc]initWithDictionary:params];
    [combinedParams addEntriesFromDictionary:[self defaultParameters]];
    [self.apiService getDataAtPath:@"explore"
                        parameters:combinedParams
                        completion:^(id response, NSError *error) {
                            NSArray *result = nil;
                            if(!error) {
                                result = [Venue venuesArrayFromResponse: response];
                            }
                            if(completion) {
                                completion(result, error);
                            }
                        }
     ];
}

- (void)loadReviewsForVenueWithIdentifier:(EntityIDType)venueID
                               completion:(void(^)(NSArray *reviews, NSError *error))completion
{
    NSDictionary *params = @{
                             @"offset"          : @(0),
                             @"limit"           : @(15),
                             @"sort"            : @"recent"
                             };
    NSMutableDictionary *combinedParams = [[NSMutableDictionary alloc]initWithDictionary:params];
    [combinedParams addEntriesFromDictionary:[self defaultParameters]];
    [self.apiService getDataAtPath:[NSString stringWithFormat:@"%@/tips", venueID]
                        parameters:combinedParams
                        completion:^(id response, NSError *error) {
                            NSArray *result = nil;
                            if(!error) {
                                result = [Review reviewsArrayFromResponse: response];
                            }
                            if(completion) {
                                completion(result, error);
                            }
                        }
     ];
}

#pragma mark - working methods
- (NSDictionary *)defaultParameters
{
    NSDateFormatter *dateFormatter = [NSDateFormatter sharedFormatter];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    return @{
             @"client_id"       : kClientID,
             @"client_secret"   : kClientSecret,
             @"v"               : [dateFormatter stringFromDate:[NSDate date]],
             };
}
@end
