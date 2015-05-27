//
//  APIService.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 26/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "APIService.h"

#import <AFNetworking/AFNetworking.h>

@interface APIService()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation APIService

#pragma mark - initialization
- (instancetype)init
{
    return [self initWithBaseURL:nil];
}

- (instancetype)initWithBaseURL:(NSString *)baseURL
{
    self = [super init];
    if(self) {
        _sessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:baseURL]
                                                  sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}

#pragma mark - public methods
- (void)getDataAtPath:(NSString *)path
           parameters:(NSDictionary *)parameters
           completion:(APIClientResponseBlock)completion
{
    [self.sessionManager GET:path
                  parameters:parameters
                     success:^(NSURLSessionDataTask *task, id responseObject) {
                         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                             if(completion) {
                                 completion(responseObject, nil);
                             }
                         });
                     }
                     failure:^(NSURLSessionDataTask *task, NSError *error) {
                         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                             if(completion) {
                                 completion(nil, error);
                             }
                         });
                     }
     ];
}

@end
