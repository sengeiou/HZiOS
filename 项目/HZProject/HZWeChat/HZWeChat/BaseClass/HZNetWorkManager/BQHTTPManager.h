//
//  BQHTTPManager.h
//  BeiqiWallet
//
//  Created by KB on 2018/2/9.
//  Copyright © 2018年 citic. All rights reserved.
//

#import "AFNetworking.h"
#import "BQHTTPRequestModel.h"

@interface BQHTTPManager : AFHTTPSessionManager
+(instancetype)httpManager;

+(NSURLSessionDataTask*)bqHttpRequestWithModel:(BQHTTPRequestModel*)requestModel
                               completeHandler:(void(^)(id  _Nullable responseObject, NSError * _Nullable error))completeHandler;
@end
