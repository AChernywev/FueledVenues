//
//  BaseCacheEntity.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 27/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BaseCacheEntity : NSManagedObject

@property (nonatomic, retain) NSString * identifier;

@end
