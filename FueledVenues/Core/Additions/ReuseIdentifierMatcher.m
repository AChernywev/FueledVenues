//
//  ReuseIdentifierMatcher.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "ReuseIdentifierMatcher.h"

@interface ItemMatching : NSObject

@property (nonatomic, copy) NSString* reuseIdentifier;
@property (nonatomic, copy) BOOL (^matchingBlock)(id);

@end

@implementation ItemMatching
@end

@interface ReuseIdentifierMatcher ()

@property (nonatomic, strong) NSMutableArray* itemMatchings;

@end

@implementation ReuseIdentifierMatcher

- (void)registerReuseIdentifier:(NSString *)reuseIdentifier
                forItemMatching:(BOOL (^)(id))matchingBlock
{
    ItemMatching* matching = [ItemMatching new];
    matching.reuseIdentifier = reuseIdentifier;
    matching.matchingBlock = matchingBlock;
    if (self.itemMatchings) {
        [self.itemMatchings addObject:matching];
    } else {
        self.itemMatchings = [NSMutableArray arrayWithObject:matching];
    }
}

- (void)registerReuseIdentifier:(NSString *)reuseIdentifier
                   forItemClass:(Class)itemClass
{
    [self registerReuseIdentifier:reuseIdentifier
                  forItemMatching:^BOOL(id item) {
                      return [item isKindOfClass:itemClass];
                  }];
}

- (NSString*)reuseIdentifierForItem:(id)item
{
    if ([item respondsToSelector:@selector(reuseIdentifier)])
        return [item reuseIdentifier];
    for (ItemMatching* matching in self.itemMatchings) {
        if (matching.matchingBlock(item))
            return matching.reuseIdentifier;
    }
    return self.defaultReuseIdentifier;
}

@end
