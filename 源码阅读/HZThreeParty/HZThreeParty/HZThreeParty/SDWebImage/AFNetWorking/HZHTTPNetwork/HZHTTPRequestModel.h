//
//  HZHTTPRequestModel.h
//  HZThreeParty
//
//  Created by KB on 2018/2/9.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,HTTPMethod){
  HTTPGET,
  HTTPPOST
};

@interface HZHTTPRequestModel : NSObject

@property(nonatomic,copy)NSDictionary* params;
@property(nonatomic,copy)NSString* apiCode;
@property(nonatomic,copy)NSString* baseURL;
@property(nonatomic,assign)HTTPMethod httpMethod;
@property(nonatomic,assign)NSTimeInterval cacheTimeInterval;
@property(nonatomic,strong)NSURLSessionDataTask* dataTask;

// 网络缓存设置
-(NSString*)requestPath;
@end
