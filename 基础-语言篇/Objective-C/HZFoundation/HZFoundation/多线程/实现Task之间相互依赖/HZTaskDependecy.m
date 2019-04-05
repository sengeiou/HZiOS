//
//  HZTaskDependecy.m
//  HZFoundation
//
//  Created by KB on 2018/8/8.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZTaskDependecy.h"

@implementation HZTaskDependecy

/*
 创建信号量
 dispatch_semaphore_create
 发送信号量 [使得信号量常数 +1]
 dispatch_semaphore_signal
 等待信号量 [如果信号量为0则根据设置的时间一直处于等待中，如果大于0则，做-1操作]
 dispatch_semaphore_wait
 */

-(void)requestAWithCompleteHandler:(void(^)(NSArray *data))completerHandler{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    //模拟网络请求
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:2.0];
        completerHandler(nil);
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"task a ....");
}

-(void)requestBWithCompleteHandler:(void(^)(NSArray *data))completerHandler{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    //模拟网络请求
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:1.0];
        completerHandler(nil);
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"task b ....");
    

}

-(void)requestCWithCompleteHandler:(void(^)(NSArray *data))completerHandler{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    //模拟网络请求
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:0.5];
        completerHandler(nil);
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"task c ....");
}


-(void)test1 {
    // A --> B --> C  ： dispatch_semaphore_t + NSBlockOperation设置依赖
    // 创建operationA
    NSBlockOperation* blockOperationA = [NSBlockOperation blockOperationWithBlock:^{
        [self requestAWithCompleteHandler:^(NSArray *data) {
            NSLog(@"====> A");
        }];
    }];
    // 创建operationB
    NSBlockOperation* blockOperationB = [NSBlockOperation blockOperationWithBlock:^{
        [self requestBWithCompleteHandler:^(NSArray *data) {
            NSLog(@"====> B");
        }];
    }];
    
    // 创建operationC
    NSBlockOperation* blockOperationC = [NSBlockOperation blockOperationWithBlock:^{
        [self requestCWithCompleteHandler:^(NSArray *data) {
            NSLog(@"====> C");
        }];
    }];
    
    // 创建operationQueue
    NSOperationQueue* operationQueue = [[NSOperationQueue alloc] init];
    
    // operation之间添加依赖关系
    [blockOperationB addDependency:blockOperationA];
    [blockOperationC addDependency:blockOperationB];
    
    [operationQueue addOperation:blockOperationA];
    [operationQueue addOperation:blockOperationB];
    [operationQueue addOperation:blockOperationC];
    
}


@end
