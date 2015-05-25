//
//  NSObject+SafeParsing.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 25/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SafeParsing)

- (NSArray *)safeArrayValue;
- (NSDictionary *)safeDictionaryValue;
- (NSNumber *)safeNumberValue;
- (NSString *)safeStringValue;
- (BOOL)safeBoolValue;
- (int)safeIntValue;
- (NSInteger)safeIntegerValue;
- (int64_t)safeInt64Value;
- (float)safeFloatValue;
- (double)safeDoubleValue;
@end
