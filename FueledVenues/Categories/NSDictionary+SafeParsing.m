//
//  NSDictionary+SafeParsing.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 25/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "NSDictionary+SafeParsing.h"

#import "NSObject+SafeParsing.h"

@implementation NSDictionary (SafeParsing)

- (NSArray *)arrayAtKey:(NSString*)key
{
    return [self[key] safeArrayValue];
}

- (NSDictionary *)dictionaryAtKey:(NSString*)key
{
    return [self[key] safeDictionaryValue];
}

- (NSNumber *)numberAtKey:(NSString*)key
{
    return [self[key] safeNumberValue];
}

- (NSString *)stringAtKey:(NSString*)key
{
    return [self[key] safeStringValue];
}

- (BOOL)boolAtKey:(NSString*)key
{
    return [self[key] safeBoolValue];
}

- (int)intAtKey:(NSString*)key
{
    return [self[key] safeIntValue];
}

- (NSInteger)integerAtKey:(NSString*)key
{
    return [self[key] safeIntegerValue];
}

- (int64_t)int64AtKey:(NSString*)key
{
    return [self[key] safeInt64Value];
}

- (float)floatAtKey:(NSString*)key
{
    return [self[key] safeFloatValue];
}

- (double)doubleAtKey:(NSString*)key
{
    return [self[key] safeDoubleValue];
}
@end
