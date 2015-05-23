//
//  IDPresenterChangeItem.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PresenterChange.h"

@interface PresenterChangeItem : NSObject <PresenterChangeItem>

@property (nonatomic, strong, readonly) NSArray* indexPaths;

@end
