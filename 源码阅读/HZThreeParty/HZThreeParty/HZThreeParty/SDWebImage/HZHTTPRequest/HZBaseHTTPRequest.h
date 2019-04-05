//
//  HZBaseHTTPRequest.h
//  HZThreeParty
//
//  Created by apple on 17/3/23.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,HTTPRquestMethod){
    HTTPRequestGET,
    HTTPRequestPOST
};

typedef void(^HZhttpRequestCompletionHandler)(NSString*errorMessage,id dataModel);

@interface HZBaseHTTPRequest : NSObject
@property(nonatomic,assign)HTTPRquestMethod requestMethod;
@property(nonatomic,copy)NSString* baseURL;
@property(nonatomic,copy)NSString* requestFilePath;
@property(nonatomic,copy)NSDictionary* parameters;
@property(nonatomic,copy)HZhttpRequestCompletionHandler  completionHandler;


/**
  数据请求API

 @param completionHandler 数据请求完成后的回调（errorMessage：服务端信息；dataModel：数据模型）
 */
-(void)httpRequestWithCompletionHandler:(void(^)(NSString*errorMessage,id dataModel))completionHandler;


/**
 请求实体处理服务端返回的数据

 @param responseData 服务端返回的请求报文
 @param errorMessage 错误信息
 */
-(void)hz_subClassHandleResponseData:(id)responseData errorMessage:(NSError*)errorMessage;

-(NSString*)hz_ConvertConnectServerErrorToString:(NSError*)error;
@end
