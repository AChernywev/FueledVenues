//
//  SectionItemProtocol.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "CollectionProtocol.h"
#import "HeaderFooterItemProtocol.h"

@class RACSignal;

@protocol SectionItemProtocol <CollectionProtocol>

@optional
@property (nonatomic, readonly, strong) RACSignal* changes;
@property (nonatomic, strong) id<HeaderFooterItemProtocol> headerItem;
@property (nonatomic, strong) id<HeaderFooterItemProtocol> footerItem;

@end