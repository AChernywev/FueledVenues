//
//  BaseEntity+Parser.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity+Parsing.h"

#import "NSDictionary+SafeParsing.h"
#import "NSMutableArray+Secure.h"

#pragma mark - EntityID Helper method
@implementation NSDictionary(EntityIDType)

- (EntityIDType)entityIDAtKey:(NSString*)key
{
    return [self stringAtKey:key];
}

@end

@implementation BaseEntity (Parsing)

#pragma mark - public methods
+ (NSString *)idKey
{
    return @"id";
}

+ (instancetype)objectWithDictionary:(NSDictionary *)values
{
    EntityIDType identifier = [values entityIDAtKey:[[self class]idKey]];
    if (identifier) {
        id result = [[[self class] alloc] initWithIdentifier:identifier];
        [result updateWithDictionary:values];
        return result;
    }
    return nil;
}

+ (NSArray *)objectsArrayWithResponse:(NSArray *)response
{
    NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:response.count];
    for(NSDictionary *dict in response) {
        [resultArray addObjectSecure:[[self class] objectWithDictionary:dict]];
    }
    return resultArray;
}

- (void)updateWithDictionary:(NSDictionary *)values
{
    NSAssert(NO, @"Subclass Me");
}

@end
