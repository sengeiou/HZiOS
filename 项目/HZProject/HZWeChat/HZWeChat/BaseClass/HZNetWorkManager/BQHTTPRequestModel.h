//
//  BQHTTPRequestModel
//
//  Created by KB on 2018/2/9.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,HZHTTPRequestType){
  HTTPGET,
  HTTPPOST
};

@interface BQHTTPRequestModel : NSObject
@property(nonatomic,copy)NSDictionary* requestParams;
@property(nonatomic,copy)NSString* requestAPICode;
@property(nonatomic,copy)NSString* requestBaseURL;
@property(nonatomic,assign)HZHTTPRequestType httpRequestType;
@property(nonatomic,strong)NSURLSessionDataTask* dataTask;
@end
