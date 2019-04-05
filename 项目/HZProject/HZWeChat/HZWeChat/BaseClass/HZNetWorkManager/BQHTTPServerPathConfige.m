//
//  BQHTTPServerPathConfige.m
//  BeiqiWallet
//
//  Created by KB on 2018/2/27.
//  Copyright © 2018年 citic. All rights reserved.
//

#import "BQHTTPServerPathConfige.h"

@interface BQHTTPServerPathConfige()

@end

@implementation BQHTTPServerPathConfige

+(instancetype)shareInstance{
    static BQHTTPServerPathConfige* shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

-(void)bqConfigeServerPath:(HZHTTPRequestServer)serverPath{
    _serverPath = serverPath;
    switch (serverPath) {
        case DEV:
        {
            _bqServerBasePath = @"http://101.200.134.35:8000";
         
        }
            break;
        case TEST:
        {
           
        }
            break;
        case TEST_SLB:
        {
           
        }
            break;
        case SLB:
        {
        
        }
            break;
            
        default:
            break;
    }
}

-(NSString*)BQ_HTTP_REQUEST_PATH{
    return [NSString stringWithFormat:@"%@/",_bqServerBasePath];
}


@end
