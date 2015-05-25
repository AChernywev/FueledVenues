//
//  NSDictionary+SafeParsing.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 25/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SafeParsing)

- (NSArray *)arrayAtKey:(NSString*)key;
- (NSDictionary *)dictionaryAtKey:(NSString*)key;
- (NSNumber *)numberAtKey:(NSString*)key;
- (NSString *)stringAtKey:(NSString*)key;
- (BOOL)boolAtKey:(NSString*)key;
- (int)intAtKey:(NSString*)key;
- (NSInteger)integerAtKey:(NSString*)key;
- (int64_t)int64AtKey:(NSString*)key;
- (float)floatAtKey:(NSString*)key;
- (double)doubleAtKey:(NSString*)key;
@end
