//
//  NSDateFormatter+Singleton.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Singleton)

+ (instancetype)sharedFormatter;
@end
