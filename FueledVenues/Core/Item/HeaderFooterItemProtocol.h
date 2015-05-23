//
//  HeadeFooterItemProtocol.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HeaderFooterItemProtocol <NSObject>
@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) BOOL hasView;

@end
