//
//  Venue+Parser.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Venue+Parsing.h"

#import "NSArray+Map.h"
#import "NSObject+SafeParsing.h"
#import "NSDictionary+SafeParsing.h"

@implementation Venue (Parser)

+ (NSArray *)venuesArrayFromResponse:(id)responseObject
{
    NSArray *responseAray = [[[[[[responseObject safeDictionaryValue] dictionaryAtKey:@"response"] arrayAtKey:@"groups"] firstObject] safeDictionaryValue] arrayAtKey:@"items"];
    responseAray = [responseAray map:^NSDictionary *(NSDictionary *dict) {
        return [dict dictionaryAtKey:@"venue"];
    }];
    //NSArray *responseAray = JSON_TO_ARRAY(JSON_TO_DICTIONARY(JSON_TO_DICTIONARY(responseObject)[@"response"])[@"venues"]);
    return [Venue objectsArrayWithResponse:responseAray];
}

- (void)updateWithResponse:(id)responseObject
{
//    [self updateWithDictionary:JSON_TO_DICTIONARY(JSON_TO_DICTIONARY(JSON_TO_DICTIONARY(responseObject)[@"response"])[@"venue"])];
}

- (void)updateWithDictionary:(NSDictionary *)values
{
    self.name = [values stringAtKey:@"name"];
    NSDictionary *locationDict = [values dictionaryAtKey:@"location"];
    self.address = [locationDict stringAtKey:@"address"];
    self.distance = [locationDict floatAtKey:@"distance"];
    self.latitude = [locationDict floatAtKey:@"lat"];
    self.longitude = [locationDict floatAtKey:@"lng"];
    
    self.isOpen = [[values dictionaryAtKey:@"hours"] boolAtKey:@"isOpen"];
    
    NSDictionary *priceDict = [values dictionaryAtKey:@"price"];
    self.tier = [priceDict integerAtKey:@"tier"];
    self.currency = [priceDict stringAtKey:@"currency"];
    self.rating = [values floatAtKey:@"rating"];
    
    NSDictionary *itemsDict = [[[[values dictionaryAtKey:@"featuredPhotos"] arrayAtKey:@"items"] firstObject] safeDictionaryValue];
    self.mainImage = [Photo objectWithDictionary:itemsDict];
}
@end
