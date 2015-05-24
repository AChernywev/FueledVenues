//
//  BaseEntity.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseEntity : NSObject
@property (nonatomic, readonly) NSString *identifier;

- (instancetype)initWithIdentifier:(NSString *)identifier;
@end

#import "BaseEntity+Parser.h"
