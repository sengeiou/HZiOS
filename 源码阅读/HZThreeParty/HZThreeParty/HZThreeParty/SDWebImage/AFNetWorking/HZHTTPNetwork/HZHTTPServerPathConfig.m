//
//  HZHTTPServerPathConfig.m
//  HZThreeParty
//
//  Created by KB on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZHTTPServerPathConfig.h"


@implementation HZHTTPServerPathConfig

+(instancetype)shareInstance{
    static HZHTTPServerPathConfig* shareInstance = nil;
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
            _hzServerBasePath = @"http://192.16.30.70:10010";
            
        }
            break;
        case TEST:
        {
            _hzServerBasePath = @"http://192.16.1.126:13080";
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

@end
