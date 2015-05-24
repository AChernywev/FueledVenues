//
//  BaseEntity+Parser.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity.h"

@interface BaseEntity (Parser)

+ (NSString *)idDictionaryKey;
+ (instancetype)objectWithDictionary:(NSDictionary *)values;
+ (NSArray *)objectsArrayWithResponse:(id)serviceResponse;
- (void)updateWithDictionary:(NSDictionary *)values;
@end
