//
//  HZFindUUNewsLogic.m
//  HZThreeParty
//
//  Created by KB on 2018/2/9.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZFindUUNewsLogic.h"
#import "BQHTTPManager.h"
@implementation HZFindUUNewsLogic
+(HZHTTPRequestModel*)hz_requestFindUUNewsWithParams:(NSDictionary*)params completeHandler:(void(^)(NSString*message,NSArray*uuNews))completeHandler{
    HZHTTPRequestModel* requestModel = [[HZHTTPRequestModel alloc] init];
//    requestModel.requestParams = params;
//    requestModel.requestAPICode = @"";
//    NSURLSessionDataTask* dataTask = [BQHTTPManager bq_httpRequestWithModel:requestModel completeHandler:^(bool isSuccess, NSDictionary *result, NSString *message) {
//
//    }];
//    requestModel.dataTask = dataTask;
    return requestModel;
}
@end
