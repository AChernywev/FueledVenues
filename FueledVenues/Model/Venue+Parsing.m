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
#import "NSMutableArray+Secure.h"

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
    NSMutableArray *locationArray = [NSMutableArray array];
    [locationArray addObjectSecure:[locationDict stringAtKey:@"address"]];
    [locationArray addObjectSecure:[locationDict stringAtKey:@"city"]];
    [locationArray addObjectSecure:[locationDict stringAtKey:@"postalCode"]];
    self.address = [locationArray componentsJoinedByString:@", "];
    self.distance = [locationDict floatAtKey:@"distance"];
    self.latitude = [locationDict floatAtKey:@"lat"];
    self.longitude = [locationDict floatAtKey:@"lng"];
    
    self.isOpen = [[values dictionaryAtKey:@"hours"] boolAtKey:@"isOpen"];
    
    NSDictionary *priceDict = [values dictionaryAtKey:@"price"];
    self.tier = [priceDict intAtKey:@"tier"];
    self.rating = [values floatAtKey:@"rating"];
    
    self.phone = [[values dictionaryAtKey:@"contact"] stringAtKey:@"phone"];
    self.websiteURL = [NSURL URLWithString: [values stringAtKey:@"url"]];
    NSDictionary *menuDict = [values dictionaryAtKey:@"menu"];
    self.menuURL = [NSURL URLWithString: [menuDict stringAtKey:@"mobileUrl"]];
    if(!self.menuURL) {
        self.menuURL = [NSURL URLWithString: [menuDict stringAtKey:@"url"]];
    }
    self.reviewsCount = [[values dictionaryAtKey:@"stats"] intAtKey:@"tipCount"];
    
    NSDictionary *itemsDict = [[[[values dictionaryAtKey:@"featuredPhotos"] arrayAtKey:@"items"] firstObject] safeDictionaryValue];
    self.mainImage = [Photo objectWithDictionary:itemsDict];
}
@end
