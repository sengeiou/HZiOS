//
//  HZAFNetWorkingViewController.m
//  HZThreeParty
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZAFNetWorkingViewController.h"

@interface HZAFNetWorkingViewController ()

@end

@implementation HZAFNetWorkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableViewItems = @[@"HZAFNetWokingBaseViewController",@"HZTestHTTPMangerViewController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
    AFNetwoking的框架图
      【        AFNetworking         】
      【        UIKit集成模块          】
      【   请求序列化  】  【 响应序列化  】
      【会话】【网络监听模块】【网络安全模块】
 
 */

/*
  NSURLSession ---   AFSecurityPolicy  ---   AFNetworkReachabilityManager
                          |
                          |
                   AFURLSessionManager
                          |
                          |  继承
                   AFHTTPSessionManager
                       |          |
                       |          |
     AFURLRequestSerialzation  AFURLReponseSerialzation
 */


/*
 
 《1》网络请求模块:【数据的上传和下载，基本的http数据请求】
 （1）基于NSURLSession {
   AFURLSessionManager{
      遵守NSURLSession的相关协议
      提供相应的dataTask方法
   }
    AFHTTPSessionManager{
       继承自AFURLSessionManager,
       提供GET POST 等遍历的方法
    }
  }
  （2）基本业务数据请求
    网络层对接业务方的API如何设计
    数据缓存【网络层如何给业务层提供数据缓存】
    网络中断重连机制【CDN挂了，域名切换，尝试重试】
    如何cancel掉已经发送出去的request
    流量控制
    数据安全(https设置,AES,RSA,TOKEN验证机制)
    api版本控制
    网络错误处理
    数据解析[json/xml/jsonp等]=》字典转模型原理
 
 （3）上传下载【图片、音视频等】
    断点续传、
    后台下载，
    进度指示
   ，网络环境改变
 
 
 
 */

  + (NSThread*)networkRequestThread {
       static NSThread*_networkRequestThread = nil;
          static dispatch_once_t oncePredicate;
            dispatch_once(&oncePredicate, ^{
                   _networkRequestThread = [[NSThread alloc] initWithTarget:self selector:@selector(networkRequestThreadEntryPoint:) object:nil];
                [_networkRequestThread start];
            });
      return _networkRequestThread;
  }

+ (void)networkRequestThreadEntryPoint:(id)__unused object {
    @autoreleasepool {
        [[NSThread currentThread] setName:@"AFNetworking"];
        
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];
    }
}









@end
