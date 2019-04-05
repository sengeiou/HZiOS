//
//  HZHTTPManager.m
//  HZThreeParty
//
//  Created by KB on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZHTTPManager.h"
#import "HZHTTPRequest.h"
#import "HZHTTPCacheManager.h"

@implementation HZHTTPManager

+(instancetype)httpManager{
    static HZHTTPManager* manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        /*
           设置安全策略
         */
        AFSecurityPolicy * securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        manager.securityPolicy = securityPolicy;
    });
    return manager;
}


+(NSURLSessionDataTask*)httpRequestWithModel:(HZHTTPRequestModel*)requestModel
                             completeHandler:(void(^)(bool isSuccess,NSDictionary*result,NSString*message))completeHandler{
    
#pragma mark -- 首先根据HZHTTPRequestModel.apiCode判断现有的缓存列表中是否存在可用本地缓存数据；
    
    
    NSURLRequest* urlRequest = [HZHTTPRequest createHTTPRequestWithHTTPRequestModel:requestModel];
    __block NSURLSessionDataTask* sessionDataTask =[[HZHTTPManager httpManager] dataTaskWithRequest:urlRequest completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error){
        if (sessionDataTask.state == NSURLSessionTaskStateCanceling) {
            completeHandler(NO,nil,@"");// 网络请求被取消
        }else{
            //判断请求获取的信息
            if (error==nil) {
                // 判断是否需要缓存数据
                if (requestModel.cacheTimeInterval>0) {
                    [HZHTTPCacheManager saveCacheWithRequestModel:requestModel];
                }
                completeHandler(YES,responseObject,nil);
            }else{
                completeHandler(NO,nil,@"网络请求错误");// 网络请求错误
            }
        }
    }];
    [sessionDataTask resume];
    return sessionDataTask;
}


@end
