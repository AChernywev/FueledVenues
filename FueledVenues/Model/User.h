//
//  User.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "BaseEntity.h"

#import "Photo.h"

@interface User : BaseEntity
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, readonly) NSString *userName;

@property (nonatomic, strong) Photo *   userPhoto;

@end
