//
//  SectionItem.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "SectionItemProtocol.h"

@interface SectionItem : NSObject <SectionItemProtocol>

- (instancetype)initWithRows:(id <CollectionProtocol>)rows;
- (void)updateRows:(id <CollectionProtocol>)newRows;
@end
