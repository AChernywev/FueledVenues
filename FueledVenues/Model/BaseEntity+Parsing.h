//
//  BaseEntity+Parser.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity.h"

@interface BaseEntity (Parsing)

+ (NSString *)idKey;
+ (instancetype)objectWithDictionary:(NSDictionary *)values;
+ (NSArray *)objectsArrayWithResponse:(NSArray *)response;
- (void)updateWithDictionary:(NSDictionary *)values;
@end
