//
//  HZNetWorkDesign.m
//  HZUIKIT
//
//  Created by KB on 2018/8/6.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZNetWorkDesign.h"

@implementation HZNetWorkDesign

/*
                  《1》 网络安全设计：
                     (0) token设计：用户登录时颁发，由服务端生成，
 
                    （1） 基于timeStamp的方案设计，为了解决重放攻击
                     + 在请求参数中带有timeStamp，并将timeStamp放在sign（签名）中；
                     + 服务端拿到timeStamp与服务器时间做对比超出60s/30s则，则认定不合法
                     + 客户端生产的timeStamp收到本地系统影响，【要设计本地时间与服务器时间同步机制】
 
                     (2) timeStamp的方案无法解决在60s/30s以内的重放攻击
 
                    （3）解决（2）中的问题是在timeStamp的基础上增加nonce参数【nonce：16位的随机数】
 
                      服务端会存储 60s/30s以内 nonce集合，发现重复则会认定为重复请求；
 
                 《2》 网络数据传输格式
                  // app端网络请求通讯数据传输协议
                     NSDictionary* requestData = @{
                             @"act":act, // 接口code
                             @"data":data, // AES加密的请求报文
                             @"secret":secret, // 经过RSA公钥加密的AES秘钥
                             @"timestamp":timestamp, // 时间戳
                             @"nonce":nonce,  // 16位随机数
                             @"sign":signStr,  // MD5(requestParms + secret +  timestamp + nonce)
                             @"v":apiVersion // 接口版本号
                     };
 
 */

@end
