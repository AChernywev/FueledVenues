//
//  SectionPresenter+Protected.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "SectionsPresenter.h"

#import "CollectionProtocol.h"

@interface SectionsPresenter ()
@property (nonatomic, strong, readwrite) id<CollectionProtocol> sections;

@end

@interface SectionsPresenter (Protected)

- (NSString *)keyPath;
@end