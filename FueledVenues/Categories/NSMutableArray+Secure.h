//
//  NSArray+Secure.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 25/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Secure)

- (void)addObjectSecure:(id)anObject;
@end
