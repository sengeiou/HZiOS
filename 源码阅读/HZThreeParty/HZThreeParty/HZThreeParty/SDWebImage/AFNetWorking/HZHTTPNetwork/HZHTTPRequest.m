//
//  HZHTTPRequest.m
//  HZThreeParty
//
//  Created by KB on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZHTTPRequest.h"
#import "HZHTTPRequestModel.h"
#import "HZHTTPManager.h"

@implementation HZHTTPRequest
+(NSMutableURLRequest*)createHTTPRequestWithHTTPRequestModel:(HZHTTPRequestModel*)httpRequestModel{
    NSMutableURLRequest *urlRequest;
    NSString *requestPath = [httpRequestModel requestPath];
    NSDictionary *params = httpRequestModel.params;
    if (httpRequestModel.httpMethod==HTTPGET) {
     urlRequest =  [[HZHTTPManager httpManager].requestSerializer requestWithMethod:@"GET" URLString:requestPath parameters:params error:nil];
    }else if (httpRequestModel.httpMethod==HTTPPOST){
      urlRequest =  [[HZHTTPManager httpManager].requestSerializer requestWithMethod:@"POST" URLString:requestPath parameters:params error:nil];
    }
    return urlRequest;
}
@end
