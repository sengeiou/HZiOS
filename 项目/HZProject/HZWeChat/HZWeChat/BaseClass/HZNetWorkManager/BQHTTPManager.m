//
//  BQHTTPManager.m
//  BeiqiWallet
//
//  Created by KB on 2018/2/9.
//  Copyright © 2018年 citic. All rights reserved.
//

#import "BQHTTPManager.h"
#import "BQHTTPURLRequest.h"
@implementation BQHTTPManager
+(instancetype)httpManager{
    static BQHTTPManager* httpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManager = [[self alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        httpManager.requestSerializer.timeoutInterval = 10.0f;
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy               policyWithPinningMode:AFSSLPinningModeNone];
        httpManager.securityPolicy = securityPolicy;
    });
    return httpManager;
}

+(NSURLSessionDataTask*)bqHttpRequestWithModel:(BQHTTPRequestModel*)requestModel
                                completeHandler:(void(^)(id  _Nullable responseObject, NSError * _Nullable error))completeHandler{
    NSMutableURLRequest* urlRequest = [BQHTTPURLRequest bqCreateHttpURLRequestWithModel:requestModel];
    __block NSURLSessionDataTask* sessionDataTask =[[BQHTTPManager httpManager] dataTaskWithRequest:urlRequest completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error){
        completeHandler(responseObject,error);
    }];
    [sessionDataTask resume];
    return sessionDataTask;
}

@end

