//
//  Venue+Parser.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Venue+Parser.h"

#import "Macroses.h"

@interface Venue ()
@property (nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) NSString *address;
@property (nonatomic, readwrite) BOOL isOpen;
@property (nonatomic, readwrite) PriceTier tier;
@property (nonatomic, readwrite) NSString *tierMessage;
@property (nonatomic, readwrite) NSString *currency;
@property (nonatomic, readwrite) float rating;
@property (nonatomic, readwrite) float distance;
@property (nonatomic, readwrite) float latitude;
@property (nonatomic, readwrite) float longitude;
@property (nonatomic, readwrite) NSURL *imageURL;

@end

@implementation Venue (Parser)

+ (NSArray *)venuesArrayFromResponse:(id)responseObject
{
    NSArray *responseAray = JSON_TO_ARRAY(JSON_TO_DICTIONARY(JSON_TO_ARRAY(JSON_TO_DICTIONARY(JSON_TO_DICTIONARY(responseObject)[@"response"])[@"groups"])[0])[@"items"]);
    //NSArray *responseAray = JSON_TO_ARRAY(JSON_TO_DICTIONARY(JSON_TO_DICTIONARY(responseObject)[@"response"])[@"venues"]);
    return [Venue objectsArrayWithResponse:responseAray];
}

- (void)updateWithDictionary:(NSDictionary *)values
{
    values = JSON_TO_DICTIONARY(values[@"venue"]);
    self.name = JSON_TO_STRING(values[@"name"]);
    NSDictionary *locationDict = JSON_TO_DICTIONARY(values[@"location"]);
    self.address = JSON_TO_STRING(locationDict[@"address"]);
    self.distance = JSON_TO_FLOAT(locationDict[@"distance"]);
    self.latitude = JSON_TO_FLOAT(locationDict[@"lat"]);
    self.longitude = JSON_TO_FLOAT(locationDict[@"lng"]);
    
    self.isOpen = JSON_TO_BOOL(JSON_TO_DICTIONARY(values[@"hours"])[@"isOpen"]);
    
    NSDictionary *priceDict = JSON_TO_DICTIONARY(values[@"price"]);
    self.tier = JSON_TO_INTEGER(priceDict[@"tier"]);
    self.currency = JSON_TO_STRING(priceDict[@"currency"]);
    self.rating = JSON_TO_FLOAT(values[@"rating"]);
    
    NSDictionary *itemsDict = JSON_TO_DICTIONARY([JSON_TO_ARRAY(JSON_TO_DICTIONARY(values[@"featuredPhotos"])[@"items"]) firstObject]);
    NSString *prefix = JSON_TO_STRING(itemsDict[@"prefix"]);
    NSString *suffix = JSON_TO_STRING(itemsDict[@"suffix"]);
    static NSString *const kThumbnailFormatSpec = @"640x326";
    NSString *photoUrlString = [NSString stringWithFormat:@"%@%@%@", prefix, kThumbnailFormatSpec, suffix];
    self.imageURL = [NSURL URLWithString:photoUrlString];
}
@end
