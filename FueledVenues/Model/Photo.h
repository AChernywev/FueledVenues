//
//  Photo.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 25/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity.h"

#import <UIKit/UIKit.h>

@interface Photo : BaseEntity
@property (nonatomic, strong) NSString *prefix;
@property (nonatomic, strong) NSString *suffix;

- (NSURL *)urlWithSize:(CGSize)size;
@end
