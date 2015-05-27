//
//  APIService.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^APIClientResponseBlock)(id response, NSError *error);

@interface APIService : NSObject

- (instancetype)initWithBaseURL:(NSString *)baseURL;
- (void)getDataAtPath:(NSString *)path
           parameters:(NSDictionary *)parameters
           completion:(APIClientResponseBlock)completion;
@end
