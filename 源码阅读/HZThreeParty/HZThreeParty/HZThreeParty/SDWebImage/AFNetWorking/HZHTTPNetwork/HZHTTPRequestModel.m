//
//  HZHTTPRequestModel.m
//  HZThreeParty
//
//  Created by KB on 2018/2/9.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZHTTPRequestModel.h"
#import "HZHTTPServerPathConfig.h"

@implementation HZHTTPRequestModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _baseURL = [HZHTTPServerPathConfig shareInstance].hzServerBasePath;
        _httpMethod = HTTPGET;
        _cacheTimeInterval = -1000;
    }
    return self;
}

-(NSString*)requestPath{
    return [NSString stringWithFormat:@"%@/%@",_baseURL,_apiCode];
}
@end
