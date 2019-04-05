//
//  HZRACSingalCreateViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/11/12.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZRACSingalCreateViewController.h"
#import <ReactiveObjC.h>
@interface HZRACSingalCreateViewController ()

@end

@implementation HZRACSingalCreateViewController

/*
   (1) 信号量（singal）
     +  程序中各种事件的承载实例
     +  程序是顺序执行的代码片段，程序可以看成代码片段的流，流的实例就是信号量
 
 
    [sessionManger GET:@"https://api.map.baidu.com/location/ip"  parameters:@{@"ak":@"mFdpmvtRaOvlVVU1rIXH4Xvh",@"coor":@"bd09ll",@"mcode":@"com.dafy.YundaiMobile"}
 
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#pragma mark -- 异步获取数据信号量
//    RACSignal *s0 = [self signalForJsonWithUrl:@"https://api.map.baidu.com/location/ip?ak=mFdpmvtRaOvlVVU1rIXH4Xvh&coor=bd09ll&mcode=com.dafy.YundaiMobile"];
//    [s0 subscribeNext:^(id  _Nullable x) {
//        NSLog(@"======>:%@",x);
//    }];
    
#pragma mark -- 多个网络请求合并问题
    
        RACSignal *s1 = [self signalForJsonWithUrl:@"https://api.map.baidu.com/location/ip?ak=mFdpmvtRaOvlVVU1rIXH4Xvh&coor=bd09ll&mcode=com.dafy.YundaiMobile"];
        RACSignal *s2 = [self signalForJsonWithUrl:@"https://api.map.baidu.com/location/ip?ak=mFdpmvtRaOvlVVU1rIXH4Xvh&coor=bd09ll&mcode=com.dafy.YundaiMobile"];
        RACSignal *s3 = [self signalForJsonWithUrl:@"https://api.map.baidu.com/location/ip?ak=mFdpmvtRaOvlVVU1rIXH4Xvh&coor=bd09ll&mcode=com.dafy.YundaiMobile"];
      // 需要合并三个网络请求结果的再执行相关操作
//    [[RACSignal combineLatest:@[s1,s2,s3]] subscribeNext:^(RACTuple * _Nullable x) {
//        NSLog(@"===>%@",x);
//    }];
    
//    [[[s1 merge:s2] merge:s3] subscribeNext:^(id  _Nullable x) {
//
//    }];
    
#pragma mark -- 各个网络请求之间存在优先级问题
    
    
    [[[s1 then:^RACSignal * _Nonnull{
        return s2 ;
    }]then:^RACSignal * _Nonnull{
        return s3 ;
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }] ;
    
    
}

-(RACSignal*)signalForJsonWithUrl:(NSString*)url{
    RACSignal *singel = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        // 创建task
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [[session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                [subscriber sendError:error];
            }else{
                NSError *error = nil;
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                if (error) {
                    [subscriber sendError:error];
                }else{
                    [subscriber sendNext:json];
                    [subscriber sendCompleted];
                }
            }
        }]resume];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return singel;
}


@end
