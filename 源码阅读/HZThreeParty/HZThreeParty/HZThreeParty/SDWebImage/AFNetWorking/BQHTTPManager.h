//
//  BQHTTPManager.h
//  BeiqiWallet
//
//  Created by KB on 2018/2/9.
//  Copyright © 2018年 citic. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
@class HZHTTPRequestModel;
@interface BQHTTPManager : AFHTTPSessionManager
+(NSURLSessionDataTask*)bq_httpRequestWithModel:(HZHTTPRequestModel*)requestModel
                                completeHandler:(void(^)(bool isSuccess,NSDictionary*result,NSString*message))completeHandler;
@end
