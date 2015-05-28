//
//  BaseEntity.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Constants.h"

@interface BaseEntity : NSObject
@property (nonatomic, readonly) EntityIDType identifier;

- (instancetype)initWithIdentifier:(EntityIDType)identifier;
@end

#import "BaseEntity+Parsing.h"
#import "BaseEntity+CacheParsing.h"
