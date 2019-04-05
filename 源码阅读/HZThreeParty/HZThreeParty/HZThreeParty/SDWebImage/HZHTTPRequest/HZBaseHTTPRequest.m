//
//  HZBaseHTTPRequest.m
//  HZThreeParty
//
//  Created by apple on 17/3/23.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZBaseHTTPRequest.h"

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

#define WEAKSELF(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define STRONGSELF(strongSelf) __strong __typeof(&*weakSelf)strongSelf = weakSelf;

static NSString* const companyBaseRequestURL = @"https:www.hz.com";

@interface HZBaseHTTPRequest()
@property(nonatomic,strong)AFHTTPSessionManager* sessionManger;
@end

@implementation HZBaseHTTPRequest


-(void)httpRequestWithCompletionHandler:(void(^)(NSString*errorMessage,id dataModel))completionHandler{
    self.completionHandler = completionHandler;
    switch (self.requestMethod) {
        case HTTPRequestGET:{
            [self hz_httpGetReqest];
        }
            break;
        case HTTPRequestPOST:{
            [self hz_httpPostRequest];
        }
            break;
        default:
            break;
    }
}

#pragma mark- HTTP GET REQUEST 

-(void)hz_httpGetReqest{
    [self.sessionManger GET:[self constructRequestURL] parameters:self.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self hz_subClassHandleResponseData:responseObject errorMessage:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self hz_subClassHandleResponseData:nil errorMessage:error];
    }];
}

#pragma mark- HTTP POST REQUEST 

-(void)hz_httpPostRequest{
    [self.sessionManger POST:[self constructRequestURL] parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self hz_subClassHandleResponseData:responseObject errorMessage:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self hz_subClassHandleResponseData:nil errorMessage:error];
    }];
}

#pragma mark- 精细处理响应数据 

-(void)hz_subClassHandleResponseData:(id)responseData errorMessage:(NSError*)errorMessage{
    // 具体业务处理由子类来实现
}

#pragma mark- 统一处理连接服务器给出的异常
-(NSString*)hz_ConvertConnectServerErrorToString:(NSError*)error{
  return @"";
}


#pragma mark- 构造请求URL

-(NSString*)constructRequestURL{
    NSString* lastRequestURL;
    if (self.requestFilePath.length>0) {
        lastRequestURL = [NSString stringWithFormat:@"%@/%@",self.baseURL,self.requestFilePath];
    }else{
        lastRequestURL =  self.baseURL;
    }
    return lastRequestURL;
}

#pragma mark- 初始化请求默认参数

-(HTTPRquestMethod)requestMethod{
    return HTTPRequestGET;
}

-(NSDictionary*)parameters{
    return @{};
}

-(NSString*)baseURL{
    return companyBaseRequestURL;
}

-(NSString*)requestFilePath{
    return @"";
}

#pragma mark- lazy init sessionManger

-(AFHTTPSessionManager*)sessionManger{
    if (_sessionManger == nil) {
        _sessionManger = [AFHTTPSessionManager manager];
    }
    return _sessionManger;
}
@end
