//
//  IDPresenterChangeSection.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "PresenterChange.h"

@interface PresenterChangeSection : NSObject <PresenterChangeSection>

@property (nonatomic, strong, readonly) NSIndexSet* indexSet;

@end
