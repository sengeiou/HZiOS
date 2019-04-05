//
//  HZOperation.m
//  HZFoundation
//
//  Created by dafy on 16/8/26.
//  Copyright © 2016年 HZ. All rights reserved.
/*
 
  http://www.cnblogs.com/wendingding/p/3811121.html
 */

#import "HZOperation.h"

typedef void(^OperationBlock)();

@interface HZOperation()
@property(nonatomic,copy)OperationBlock operationBlcok;
@end

@implementation HZOperation

//-(void)operation{
//  NSOperation
//}

-(void)operationBlock{
    NSBlockOperation* blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"blockOp1:%@",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"blockOp2:%@",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"blockOp3:%@",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        [NSThread sleepForTimeInterval:3.0f];
        NSLog(@"blockOp4:%@",[NSThread currentThread]);
    }];
    blockOperation.completionBlock = ^{
        NSLog(@"blockOperation over!");
    };
    [blockOperation start];
    NSLog(@"run over!!!:%@",[NSThread currentThread]);
    /*
      HZFoundation[46406:1977543] blockOp3:<NSThread: 0x100700110>{number = 2, name = (null)}
      HZFoundation[46406:1977541] blockOp2:<NSThread: 0x1001037c0>{number = 3, name = (null)}
      HZFoundation[46406:1977517] blockOp1:<NSThread: 0x100502e50>{number = 1, name = main}
      HZFoundation[46406:1977542] blockOp4:<NSThread: 0x100700150>{number = 4, name = (null)}
      HZFoundation[46406:1977517] run over!!!:<NSThread: 0x100502e50>{number = 1, name = main}
     */
}

-(void)implementationBlockOperation{
    // 添加task
    OperationBlock block1=^{
        NSLog(@"block1%@",[NSThread currentThread]);
    };
    OperationBlock block2=^{
        NSLog(@"block2%@",[NSThread currentThread]);
    };
    OperationBlock block3=^{
        NSLog(@"block3%@",[NSThread currentThread]);
    };
    OperationBlock block4=^{
        NSLog(@"block4%@",[NSThread currentThread]);
    };
    OperationBlock block5=^{
        [NSThread sleepForTimeInterval:3.0f];
        NSLog(@"block5%@",[NSThread currentThread]);
    };
    // 所有执行task的集合
    NSArray* operationBlcoks = [NSArray arrayWithObjects:block1,block2,block3,block4,block5,nil];
    //根据打印的block执行线程名称可以看到，线程名称各不相同，由此推测block的执行在一个并发队列中
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.*.implementationBlockOperation", DISPATCH_QUEUE_CONCURRENT);
    //打印的内容可以看到NSOperation是block住主线程的，也就是所有的任务执行完毕后才继续执行task，能够执行此操作的dispatch_group最合适
    dispatch_group_t dispatchGroup = dispatch_group_create();
    for (NSInteger index=0; index<operationBlcoks.count; index++) {
        // ?? 此处存在问题 
        // 此处的状态判断是由于打印线程名称看到每次第一个任务的执行线程总是在主线程中完成的
        if (index==0) {
            // 此处处理和原设计相违背，虽然是在主线程中执行但是执行的顺序每次都是最先添加的被执行
            OperationBlock block = operationBlcoks[0];
            block();
        }else{
            dispatch_group_async(dispatchGroup, concurrentQueue, ^{
                OperationBlock block = operationBlcoks[index];
                block();
            });
        }
    }
    dispatch_group_wait(dispatchGroup, DISPATCH_TIME_FOREVER);
    NSLog(@"implementationBlockOperation over!%@",[NSThread currentThread]);
}


/**
 *  NSInvocationOperation
 */
-(void)operationInvocation{
    NSInvocationOperation* operation1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(operationAction) object:nil];
    [operation1 start];
}

-(void)operationAction{
    NSLog(@"%@--->",[NSThread currentThread]);
}


-(void)operationQueue{
    // 创建operation
    NSBlockOperation* blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"blockOp1:%@",[NSThread currentThread]);
    }];
    NSBlockOperation* blockOperation1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"blockOp2:%@",[NSThread currentThread]);
    }];
    // 创建operationQueue
    NSOperationQueue* operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:blockOperation];
    [operationQueue addOperation:blockOperation1];  
    [operationQueue setMaxConcurrentOperationCount:4]; // 设置task最大执行并发数
    [blockOperation addDependency:blockOperation1];// operation之间添加依赖关系
    [operationQueue waitUntilAllOperationsAreFinished];// 等待所有的operation执行完毕后
    [operationQueue cancelAllOperations];//取消所有operation操作

    // 任务执行状态

    
    // 任务执行状态控制 
}









@end
