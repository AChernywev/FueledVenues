//
//  BaseEntity+Parser.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity+Parser.h"

@implementation BaseEntity (Parser)

+ (NSString *)idDictionaryKey
{
    return @"id";
}

+ (instancetype)objectWithDictionary:(NSDictionary *)values
{
    NSString * identifier = values[[[self class] idDictionaryKey]];
    id result = [[[self class] alloc] initWithIdentifier:identifier];
    [result updateWithDictionary:values];
    return result;
}

+ (NSArray *)objectsArrayWithResponse:(id)serviceResponse
{
    if ([serviceResponse isKindOfClass:[NSArray class]]) {
        NSArray *dictionaryArray = (NSArray *)serviceResponse;
        NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:dictionaryArray.count];
        for(NSDictionary *dict in dictionaryArray) {
            [resultArray addObject:[[self class] objectWithDictionary:dict]];
        }
        return resultArray;
    }
    else if([serviceResponse isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dictionary = (NSDictionary *)serviceResponse;
        return @[[[self class] objectWithDictionary:dictionary]];
    }
    return nil;
}

- (void)updateWithDictionary:(NSDictionary *)values
{
    NSAssert(NO, @"Subclass Me");
}

@end
