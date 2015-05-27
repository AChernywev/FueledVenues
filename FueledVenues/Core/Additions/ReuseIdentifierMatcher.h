//
//  ReuseIdentifierMatcher.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReuseIdentifierMatcher : NSObject

@property (nonatomic, copy) NSString* defaultReuseIdentifier;

- (void)registerReuseIdentifier:(NSString*)reuseIdentifier
                   forItemClass:(Class)itemClass;

- (NSString*)reuseIdentifierForItem:(id)item;
@end
