//
//  SectionItem+Protected.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "SectionItem.h"

@interface SectionItem ()
@property (nonatomic, strong, readwrite) id <CollectionProtocol> rows;

@end

@interface SectionItem (Protected)

- (NSString*)keyPath;
@end
