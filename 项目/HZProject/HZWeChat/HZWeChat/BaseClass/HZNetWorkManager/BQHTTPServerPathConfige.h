//
//  BQHTTPServerPathConfige.h
//  BeiqiWallet
//
//  Created by KB on 2018/2/27.
//  Copyright © 2018年 citic. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,HZHTTPRequestServer){
    DEV,
    TEST,
    TEST_SLB,
    SLB,
};

@interface BQHTTPServerPathConfige : NSObject

@property(nonatomic,copy)NSString* BQ_HTTP_REQUEST_PATH;
@property(nonatomic,assign)HZHTTPRequestServer serverPath;
@property(nonatomic,copy)NSString* bqServerBasePath;


+(instancetype)shareInstance;

-(void)bqConfigeServerPath:(HZHTTPRequestServer)serverPath;
@end
