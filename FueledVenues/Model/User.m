//
//  User.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 28/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "User.h"

#import "NSMutableArray+Secure.h"

@implementation User

- (NSString *)userName
{
    NSMutableArray *parts = [NSMutableArray arrayWithCapacity:2];
    [parts addObjectSecure:self.firstName];
    [parts addObjectSecure:self.lastName];
    return [parts componentsJoinedByString:@" "];
}

+ (NSSet *)keyPathsForValuesAffectingUserName
{
    return [NSSet setWithObjects:@"firstName", @"lastName", nil];
}
@end
