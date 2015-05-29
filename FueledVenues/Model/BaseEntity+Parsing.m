//
//  BaseEntity+Parser.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity+Parsing.h"

#import "NSDictionary+SafeParsing.h"
#import "NSArray+Map.h"
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

+ (EntityIDType)defaultIdentifierWithDictionary:(NSDictionary *)values
{
    return nil;
}

+ (instancetype)objectWithDictionary:(NSDictionary *)values
{
    EntityIDType identifier = [values entityIDAtKey:[[self class]idKey]];
    if(!identifier) {
        identifier = [[self class] defaultIdentifierWithDictionary:values];
    }
    id result = [[[self class] alloc] initWithIdentifier:identifier];
    [result updateWithDictionary:values];
    return result;
}

+ (NSArray *)objectsArrayWithResponse:(NSArray *)response
{
    return [response map:^id(id object) {
        return [[self class] objectWithDictionary:object];
    }];
}

- (void)updateWithDictionary:(NSDictionary *)values
{
    NSAssert(NO, @"Subclass Me");
}

@end
