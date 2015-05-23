//
//  SectionItem+Protected.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "SectionItem+Protected.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation SectionItem (Protected)

- (NSString*)keyPath
{
    return @keypath(self, rows);
}
@end
