//
//  BQHTTPManager.m
//  BeiqiWallet
//
//  Created by KB on 2018/2/9.
//  Copyright © 2018年 citic. All rights reserved.
//

#import "BQHTTPManager.h"
#import "HZHTTPRequestModel.h"

@implementation BQHTTPManager
+(instancetype)httpManager{
    static BQHTTPManager* httpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManager = [[self alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        httpManager.requestSerializer = [AFJSONRequestSerializer serializer];
        httpManager.responseSerializer = [AFJSONResponseSerializer serializer];
        httpManager.requestSerializer.timeoutInterval = 10.0f;
    });
    return httpManager;
}


+(NSURLSessionDataTask*)bq_httpRequestWithModel:(HZHTTPRequestModel*)requestModel
                                completeHandler:(void(^)(bool isSuccess,NSDictionary*result,NSString*message))completeHandler{
    NSURLRequest* urlRequest = nil;
    __block NSURLSessionDataTask* sessionDataTask =[[BQHTTPManager httpManager] dataTaskWithRequest:urlRequest completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error){
        if (sessionDataTask.state == NSURLSessionTaskStateCanceling) {
            completeHandler(NO,nil,@"");// 网络请求被取消
        }else{
            //判断请求获取的信息
        }
    }];
    return sessionDataTask;
}



//+(NSURLRequest*)bq_createHttpURLRequestWithModel:(HZHTTPRequestModel*)requestModel{
//    NSMutableURLRequest* urlRequest;
//    NSString* requestPath = [NSString stringWithFormat:@"%@/%@",requestModel.requestBaseURL,requestModel.requestAPICode];
//    if (requestModel.httpRequestType == HTTPGET) {
//        urlRequest = [[BQHTTPManager httpManager].requestSerializer requestWithMethod:@"GET" URLString:requestPath parameters:requestModel.requestParams error:nil];
//    }else if (requestModel.httpRequestType == HTTPPOST){
//        urlRequest = [[BQHTTPManager httpManager].requestSerializer requestWithMethod:@"POST" URLString:requestPath parameters:requestModel.requestParams error:nil];
//    }
//    return urlRequest;
//}

    
@end
