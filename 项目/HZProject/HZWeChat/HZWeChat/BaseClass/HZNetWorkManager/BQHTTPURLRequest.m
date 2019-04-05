//
//  BQHTTPURLRequest.m
//  BeiqiWallet
//
//  Created by KB on 2018/2/27.
//  Copyright © 2018年 citic. All rights reserved.
//

#import "BQHTTPURLRequest.h"
#import "BQHTTPManager.h"
#import "BQHTTPRequestModel.h"
#import "BQHTTPServerPathConfige.h"

@implementation BQHTTPURLRequest

+(NSMutableURLRequest*)bqCreateHttpURLRequestWithModel:(BQHTTPRequestModel*)requestModel{
    NSMutableURLRequest* urlRequest;
    NSMutableDictionary* requestParams = [NSMutableDictionary dictionaryWithDictionary:requestModel.requestParams];
    NSString* apiCode = requestModel.requestAPICode;
    NSString* baseURL = [BQHTTPServerPathConfige shareInstance].BQ_HTTP_REQUEST_PATH;
    NSString* requestPath = [NSString stringWithFormat:@"%@%@",baseURL,apiCode];
    // HTTP请求完整报文
    NSDictionary* requestData = [requestParams copy];
    [[BQHTTPManager httpManager].requestSerializer setTimeoutInterval:10.0f];
    if (requestModel.httpRequestType == HTTPGET) {
        urlRequest = [[BQHTTPManager httpManager].requestSerializer requestWithMethod:@"GET" URLString:requestPath parameters:requestData error:nil];
    }else if (requestModel.httpRequestType == HTTPPOST){
        urlRequest = [[BQHTTPManager httpManager].requestSerializer requestWithMethod:@"POST" URLString:requestPath parameters:requestData error:nil];
    }
    return urlRequest;
}
@end
