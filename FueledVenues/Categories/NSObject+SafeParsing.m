//
//  NSObject+SafeParsing.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 25/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "NSObject+SafeParsing.h"

#import "Macroses.h"

@implementation NSObject (SafeParsing)

- (NSArray *)safeArrayValue
{
    typeof(self) maybeNilSelf = NULL_TO_NIL(self);
    return [maybeNilSelf isKindOfClass:[NSArray class]] ? (NSArray *)maybeNilSelf : nil;
}

- (NSDictionary *)safeDictionaryValue
{
    typeof(self) maybeNilSelf = NULL_TO_NIL(self);
    return [maybeNilSelf isKindOfClass:[NSDictionary class]] ? (NSDictionary *)maybeNilSelf : nil;
}

- (NSNumber *)safeNumberValue
{
    typeof(self) maybeNilSelf = NULL_TO_NIL(self);
    if([maybeNilSelf isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)maybeNilSelf;
    }
    else if([maybeNilSelf isKindOfClass:[NSString class]]) {
        static NSNumberFormatter *formatter = nil;
        if(!formatter) {
            formatter = [[NSNumberFormatter alloc]init];
        }
        return [formatter numberFromString:(NSString *)maybeNilSelf];
    }
    else {
        return nil;
    }
}

- (NSString *)safeStringValue
{
    typeof(self) maybeNilSelf = NULL_TO_NIL(self);
    if([maybeNilSelf isKindOfClass:[NSString class]]) {
        return (NSString *)maybeNilSelf;
    }
    else if([maybeNilSelf isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@", maybeNilSelf];
    }
    else {
        return nil;
    }
}

- (BOOL)safeBoolValue
{
    return [self safeNumberValue].boolValue;
}

- (int)safeIntValue
{
    return [self safeNumberValue].intValue;
}

- (NSInteger)safeIntegerValue
{
    return [self safeNumberValue].integerValue;
}

- (int64_t)safeInt64Value
{
    return [self safeNumberValue].longValue;
}

- (float)safeFloatValue
{
    return [self safeNumberValue].floatValue;
}

- (double)safeDoubleValue
{
    return [self safeNumberValue].doubleValue;
}
@end
