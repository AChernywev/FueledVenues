//
//  Photo+Parsing.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Photo+Parsing.h"

#import "NSDictionary+SafeParsing.h"

@implementation Photo (Parsing)

- (void)updateWithDictionary:(NSDictionary *)values
{
    self.prefix = [values stringAtKey:@"prefix"];
    self.suffix = [values stringAtKey:@"suffix"];
}
@end
