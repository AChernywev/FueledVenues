//
//  User+Parsing.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "User+Parsing.h"

#import "NSDictionary+SafeParsing.h"
#import "Photo+Parsing.h"

@implementation User (Parsing)

- (void)updateWithDictionary:(NSDictionary *)values
{
    self.firstName = [values stringAtKey:@"firstName"];
    self.lastName = [values stringAtKey:@"lastName"];
    self.userPhoto = [Photo objectWithDictionary:[values dictionaryAtKey:@"photo"]];
}

@end
