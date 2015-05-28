//
//  Review+Parsing.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Review+Parsing.h"

#import "User+Parsing.h"
#import "NSObject+SafeParsing.h"
#import "NSDictionary+SafeParsing.h"

@implementation Review (Parsing)

+ (NSArray *)reviewsArrayFromResponse:(id)responseObject
{
    NSArray *responseAray = [[[[responseObject safeDictionaryValue] dictionaryAtKey:@"response"] dictionaryAtKey:@"tips"] arrayAtKey:@"items"];
    return [Review objectsArrayWithResponse:responseAray];
}

- (void)updateWithDictionary:(NSDictionary *)values
{
    self.text = [values stringAtKey:@"text"];
    self.createdAt = [values timeIntervalDateAtKey:@"createdAt"];
    self.user = [User objectWithDictionary:[values dictionaryAtKey:@"user"]];
}

@end
