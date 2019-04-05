//
//  HZHTTPServerPathConfig.h
//  HZThreeParty
//
//  Created by KB on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,HZHTTPRequestServer){
    DEV,
    TEST,
    TEST_SLB,
    SLB,
};


@interface HZHTTPServerPathConfig : NSObject

@property(nonatomic,assign)HZHTTPRequestServer serverPath;

@property(nonatomic,copy)NSString* hzServerBasePath;

+(instancetype)shareInstance;

-(void)bqConfigeServerPath:(HZHTTPRequestServer)serverPath;
@end
