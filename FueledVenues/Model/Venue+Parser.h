//
//  Venue+Parser.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Venue.h"

@interface Venue (Parser)

+ (NSArray *)venuesArrayFromResponse:(id)responseObject;
- (void)updateWithResponse:(id)responseObject;
@end
