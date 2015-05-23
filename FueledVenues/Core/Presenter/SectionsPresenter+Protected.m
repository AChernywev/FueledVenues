//
//  SectionPresenter+Protected.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "SectionsPresenter+Protected.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation SectionsPresenter (Protected)

- (NSString *)keyPath
{
    return @keypath(self, sections);
}
@end
