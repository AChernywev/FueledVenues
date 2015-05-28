//
//  Review.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity.h"

#import "User.h"

@interface Review : BaseEntity
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *  createdAt;
@property (nonatomic, strong) User *    user;

@end
