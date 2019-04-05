//
//  HZLoginAndRegisterLogic.m
//  HZWeChat
//
//  Created by KB on 2018/6/20.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "HZLoginAndRegisterLogic.h"

@implementation HZLoginAndRegisterLogic

+(void)loginWithPhoneNumber:(NSString*)phoneNumber passWord:(NSString*)passWord completeHandler:(void(^)(bool isSuccess,NSString*message))completeHandler{
    BQHTTPRequestModel* loginModel = [[BQHTTPRequestModel alloc] init];
    loginModel.requestParams = @{@"phoneNumber" : phoneNumber,
                                 @"password" : passWord};
    loginModel.requestAPICode = LOGIN;
    [BQHTTPManager bqHttpRequestWithModel:loginModel completeHandler:^(id  _Nullable responseObject, NSError * _Nullable error) {
        
    }];
}

@end
