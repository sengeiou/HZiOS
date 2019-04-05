//
//  BQHTTPRequestModel.m
//
//  Created by KB on 2018/2/9.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "BQHTTPRequestModel.h"
#import "BQHTTPServerPathConfige.h"

@implementation BQHTTPRequestModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _requestBaseURL = [BQHTTPServerPathConfige shareInstance].BQ_HTTP_REQUEST_PATH;
        _httpRequestType = HTTPPOST;
    }
    return self;
}

-(NSString *)requestBaseURL{
   return [NSString stringWithFormat:@"%@",_requestBaseURL];
}
@end
