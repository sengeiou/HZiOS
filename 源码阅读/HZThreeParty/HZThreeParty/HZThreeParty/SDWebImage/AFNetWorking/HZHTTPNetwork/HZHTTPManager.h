//
//  HZHTTPManager.h
//  HZThreeParty
//
//  Created by KB on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "HZHTTPRequestModel.h"
@interface HZHTTPManager : AFHTTPSessionManager

+(instancetype)httpManager;

+(NSURLSessionDataTask*)httpRequestWithModel:(HZHTTPRequestModel*)requestModel
                                completeHandler:(void(^)(bool isSuccess,NSDictionary*result,NSString*message))completeHandler;

@end
