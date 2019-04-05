//
//  HZGCD.m
//  HZFoundation
//
//  Created by dafy on 16/8/26.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZGCD.h"

@interface HZGCD()
@property(nonatomic,strong)NSMutableArray *datas;
@property(nonatomic,strong)dispatch_queue_t concurrentQueue;

@property(nonatomic,assign)NSInteger count;
@end

@implementation HZGCD

@synthesize datas = _datas;

@synthesize count = _count;


#pragma mark -- 利用dispatch_barrier_async和DISPATCH_QUEUE_CONCURRENT实现对象属性读写的线程安全操作
-(void)setCount:(NSInteger)count{
    dispatch_barrier_async(_concurrentQueue, ^{
        _count = count;
    });
}

-(NSInteger)count{
    __block NSInteger temp = 0 ;
    dispatch_sync(_concurrentQueue, ^{
        temp = _count;
    });
    return temp;
}



-(NSMutableArray *)datas{
    if(_datas ==nil){
        _datas = [NSMutableArray array];
    }
    return _datas;
}

-(dispatch_queue_t)concurrentQueue{
    if(_concurrentQueue == nil){
        _concurrentQueue = dispatch_queue_create("com.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    }
    return _concurrentQueue;
}

-(void)setDatas:(NSMutableArray *)datas{
    _datas = datas;
}




/**
*  死锁模式
*/
-(void)GCDDeadLock1{
    
    /*
     下述代码会造成死锁
     系统主线程会逐步添加任务到队列中，先添加任务1，然后main_queue中添加任务2，系统主线程在添加任务3；最终系统主线程队列会将main_queue中的任务添加到自己队列的后面；
     此场景系统主线程队列任务排序会是 任务1-》任务3-》任务2
     系统根据队列执行完任务1后会执行任务3，但是由于任务3之前执行的是同步任务，他会等待任务2，而任务2又是排在任务3之后，所以造成死锁
     */
    NSLog(@"1"); // 任务1
    dispatch_sync(dispatch_get_main_queue(), ^{
        [NSThread sleepForTimeInterval:1.0f];
        NSLog(@"2"); // 任务2
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        // [NSThread sleepForTimeInterval:1.0f];
        NSLog(@"4"); // 任务2
    });
    NSLog(@"3"); // 任务3
    
    
    /*
     下述代码说明任务是如何被添加到主线程队列中然后才被执行的
     */
    
    NSLog(@"11"); // 任务11
    dispatch_async(dispatch_get_main_queue(), ^{
        [NSThread sleepForTimeInterval:1.0f];
        NSLog(@"12"); // 任务12
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSLog(@"14"); // 任务14
    });
    NSLog(@"13"); // 任务13
}

/**
 *  同步执行全局队列中的任务
 */
-(void)GCDOperationTask{
    NSLog(@"1");//任务1
    // 同步等待执行任务
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [NSThread sleepForTimeInterval:2.0f];
        NSLog(@"2");
    });
    NSLog(@"3");
    
    //
    @synchronized(self){
        
    }
    
    // 打印结果是  任务1-》任务2-》任务3
}

/**
 *  自创建的同步队列中执行任务
 */
-(void)GCDOperationTask1{
    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1"); // 任务1
    dispatch_async(queue, ^{
        NSLog(@"2"); // 任务2
        
        /*
         任务3和任务4造成死锁
         任务3在队列中处在任务4的后面，任务4的执行需要在等待任务3的执行
         */
        dispatch_sync(queue, ^{
            NSLog(@"3"); // 任务3
        });
        NSLog(@"4"); // 任务4
    });
    NSLog(@"5"); // 任务5
    NSLog(@"6");
    NSLog(@"7");
    NSLog(@"8");
}

/**
 *  异步执行并发线程
 */
-(void)GCDOperationTask2{
    NSLog(@"1"); // 任务1
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"2"); // 任务2
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"3"); // 任务3
        });
        NSLog(@"4"); // 任务4
    });
    NSLog(@"5"); // 任务5
    
    // 1->2->5->3>4   //2和5的顺序不确定
}

-(void)GCDOperationTash3{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1"); // 任务1
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"2"); // 任务2
        });
        NSLog(@"3"); // 任务3
    });
    NSLog(@"4"); // 任务4
    // ===> 结果只有 4 1  2 3  【4和1位置不确定的】
}






//////  dispatch_group 的使用////////

-(void)dowloadTasks1{
    dispatch_group_t group  = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.dafy", DISPATCH_QUEUE_CONCURRENT);
    NSMutableArray* tempArray = [NSMutableArray array];
    for (NSUInteger index=0; index<10; index++) {
        dispatch_group_enter(group);
        dispatch_group_async(group,queue, ^{
            NSLog(@"adsgadsgadfg");
            [NSThread sleepForTimeInterval:1.0f];
            dispatch_group_leave(group);
            [tempArray addObject:@(index)];
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"task finished===>:%@",tempArray);//此任务在主线程中执行
    });
}



-(void)dowloadTasks{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:4.0];
        NSLog(@"task1");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"task2");
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"task finished!!");//此任务在主线程中执行
    });
    
    NSLog(@"test finished");
    
//    // 多个网络请求完成后再做新的任务
//    dispatch_group_enter(group);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        //网络请求操作1
//        dispatch_group_leave(group);
//    });
//    dispatch_group_enter(group);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        //网络请求操作2
//        dispatch_group_leave(group);
//    });
}



#pragma mark- dispatch Semaphore
-(void)dispatch_Semaphore
{
    // 1  向数组中增加对象由于内存错误导致异常的概率会很高
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSMutableArray* mutable_arr =[NSMutableArray array];
    for(int i = 0;i<100000;++i)
    {
        dispatch_async(queue, ^{
            [mutable_arr addObject:[NSNumber numberWithInt:i]];
        });
    }
    
    
    // 2 使用dispatch_semaphore进行更细粒度的线程管理
    dispatch_queue_t global_queue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    /*
     生成Dispatch Semahpore
     dispatch_Semahpore 的计数初始值设定为“1”
     这样能保证访问NSMutableArray类对象的线程，同时只有1个
     */
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    NSMutableArray* array =[NSMutableArray array];
    for(int i = 0;i<10000;i++)
    {
        dispatch_async(global_queue, ^{
            /*
             等待Dispatch Semaphore
             直到Dispatch Semphore的计数值达到大于等于1；
             */
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            
            /*
             由于dispatch Semaphore 的计数值达到大于等于1
             所以将Dispatch semaphore 的计数值减去1
             dispatch_semaphore_wait 函数执行返回
             执行到此 dispatch Semaphore的计数值恒为“0”
             */
            
            [array addObject:[NSNumber numberWithInt:i]];
            
            /*
             排他控制处理结束，所以通过dispatch_semaphore_signal函数 将
             Dispatch Semaphore的计数值加1
             
             如果有通过dispatch_semaphore_wait 函数 等待dispatch Semaphore 的计数值增加的线程 就由最先等待的线程执行
             */
            dispatch_semaphore_signal(semaphore);
            
        });
    }
}


#pragma mark- 挂起队列 和 执行队列
-(void)suspendAndresumeQueue
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //挂起队列
    dispatch_suspend(queue);
    //恢复指定队列
    dispatch_resume(queue);
}

#pragma mark- dispatch_apply
-(void)dispatch_apply
{
    NSMutableArray* tempArr  = [@[@"key1",@"key2",@"key3",@"key4",@"key5"] mutableCopy];
    // 1 按照指定的次数将指定的Block追加到指定的Dispatch_Queue中，并等待全部处理执行结束
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply([tempArr count], queue, ^(size_t index) {
        // 要做数据更新操作
        NSLog(@"%d",index);
    });
    NSLog(@"task done");
    /*
     1 对数组进行循环遍历的方法
     1》 for循环
     2》 block
     3》 dispatch_apply
     2 dispatch_apply 要等待结束，最好和 dispatch_async函数混合使用
     */
    
    //
}

#pragma mark- dispatch_sync 的使用
-(void)dispatch_sync
{
    /*
     dispatch_sync 函数意味着等待；它要等待task执行完毕后再做返回
     */
    /// 1 使用dispatch_sync 容易造成死锁
    //>1在主线程中执行以下源代码会造成死锁
    /*
     main_queue 是一个serialQueue ，使用dispatch_sync将task加入到mainqueue中task会等待mainqueue中的任务执行完成，而mainqueue又要等待task完成，由此造成了死锁；
     */
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    dispatch_sync(main_queue, ^{
        NSLog(@"hello dispatch_sync!");
    });
    //>2在主线程中执行以下源代码也会造成死锁
    dispatch_async(main_queue, ^{
        dispatch_sync(main_queue, ^{
            NSLog(@"hello!!");
        });
    });
    
}


#pragma mark- dispatch_barrier_async 的使用
-(void)dispatch_barrier_async
{
    /*
     使用concurrent dispatch queue 和 dispatch barrier async 函数可实现高效率的数据库访问和文件读取
     */
    
    
    dispatch_queue_t queue = dispatch_queue_create("test.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"task1forReading!");
    });
    dispatch_async(queue, ^{
        NSLog(@"task2forReading!");
    });
    dispatch_async(queue, ^{
        NSLog(@"task3forReading!");
    });
    dispatch_barrier_async(queue, ^{
        // 此taskforWriting 会等到加入concurrentQueue中的task执行完毕后，执行taskforWriting，等到该taskforWriting执行完毕后在执行 concurrentQueue中的task
        NSLog(@"taskforWriting!");
    });
    dispatch_async(queue, ^{
        NSLog(@"task4forReading!");
    });
    dispatch_async(queue, ^{
        NSLog(@"task5forReading!");
    });
}

#pragma mark- dispatch group 的使用
-(void)dispatch_group
{
    
    /*
     1; 如果使用 serial queue 所有的task执行完毕后在执行done task
     2：如果使用 concurrent queue 所有的task执行后没办法 执行行done task 就需要 dispatch_group
     */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    //
    dispatch_group_async(group, queue, ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [NSThread sleepForTimeInterval:7.0];
            NSLog(@"blok4444444");
        });
        NSLog(@"blok1");
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"blok2");
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:5.0];
        NSLog(@"blok3");
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:2.0];
        NSLog(@"blok4");
    });
    // 监听group 中的task 是否已经全部执行完成
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"done!!");
    });
    
    //    // 等待group中的task全部完成再 执行操作
    //    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    NSLog(@"all finish!!!!");
}


#pragma mark- dispatch_after
-(void)dispatch_after
{
    /*
     延迟若干时间处理某一个Task，只是追加task到某一个队列，并不一定立即执行task
     */
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSLog(@"wait at least three seconds!!");
    });
}


#pragma mark- dispatch_set_target_queue 的使用
-(void)dispatch_set_target_queue
{
    /*
     dispatch_set_target_queue的第一个参数是指定要变更优先级的队列；指定与要使用优先级相同优先级的队列为第二个参数
     */
    dispatch_queue_t serialqueue1 = dispatch_queue_create("serialqueue1", NULL);
    dispatch_queue_t serialqueue2 = dispatch_queue_create("serialqueue2", NULL);
    dispatch_set_target_queue(serialqueue2, serialqueue1);
    /*
     s1--->s2--->p1
     serialqueue1中所有的task加入到serialqueue2中，内部处理会讲serialqueue1中的所有task处理完成后再处理serialqueue2
     */
    // dispatch_set_target_queue(serialqueue1, serialqueue2);
    
    /*
     s1--->p1--->s2
     首先执行的时候 serialqueue2 ，没有task，所以将serialqueue1中的一个任务加入到serialqueue2
     */
    
    
    dispatch_async(serialqueue1, ^{
        [self task:@"s1"];
    });
    dispatch_async(serialqueue2, ^{
        [self testTask:@"p1"];
    });
    dispatch_async(serialqueue1, ^{
        [self task:@"s2"];
    });
    dispatch_async(serialqueue2, ^{
        [self testTask:@"p2"];
    });
    dispatch_async(serialqueue1, ^{
        [self task:@"s3"];
    });
    dispatch_async(serialqueue1, ^{
        [self task:@"s4"];
    });
    
}

-(void)task:(NSString*)task
{
    // [NSThread sleepForTimeInterval:4.0f];
    NSLog(@"%@",task);
}

-(void)testTask:(NSString*)task
{
    // [NSThread sleepForTimeInterval:2.0f];
    NSLog(@"%@",task);
}


#pragma mark- 获取系统提供的MainQueue 和 globalQueue
-(void)getSystemQueue
{
    /*
     dispatch_get_main_queue:添加到该队列的处理都会在runloop中执行；
     它是一种 serial queue
     */
    dispatch_sync(dispatch_get_main_queue(), ^{
        
    });
    
    /*
     dispatch_get_global_queue:它是一种 concurrent queue；可替代concurrent queue使用
     */
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
}

#pragma mark- 创建GCD提供的两种队列
-(void)createQueue
{
    // 串行队列的创建
    /*
     1 serial queue
     1>serial Queue：系统默认创建一个线程，队列中的任务是顺序执行
     2>创建多个serial queue 的执行是并发的没有顺序
     3>解决数据竞争问题：可以将任务放在serial queue中 保证任务按照顺序执行就能解决数据竞争
     */
    dispatch_queue_t mySerialQueue = dispatch_queue_create("com.hua.example.serialQueue", DISPATCH_QUEUE_SERIAL);
    
    // 并发队列的创建
    /*
     1 concurrent queue 添加到队列中的任务会并发执行，没有顺序性
     */
    dispatch_queue_t myConcurrent=dispatch_queue_create("com.hua.example.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
}


#pragma mark- 回顾GCD

-(void)testGCD
{
    /*
     dispatch_get_global_queue
     (1)global queue 是一种concurrent queue，可以通过设置queue的priority指定执行的优先级；
     */
    dispatch_queue_t global_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 全局的子线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
    
    /*
     dispatch_get_main_queue
     （1）main queue 是一中serial queue，task是放在主线程的Runloop中执行的；
     （2）一些UI的更新操作需要放在主线程中，使用main queue是比较简单的
     */
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
}

//// 创建一个单例
//+(instancetype)shareInstance
//{
//    static ViewController* _vc;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _vc =[[self alloc] init];
//    });
//    return _vc;
//}



-(void)test4{
    // 1 同步串行 {主队列、自定义串行队列}
    dispatch_sync(dispatch_get_main_queue(), ^{
        /*
           主线程执行这段代码会造成死锁
           + 主队列中存在Task1，Task2；
           + Task1执行中调用Blcok执行Task2
           + 由于队列的属性Task2的执行依赖于Task1
           + 因此会造成Task1与Task2之间相互等待
         */
    });
    
    dispatch_queue_t serialQueue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(serialQueue, ^{
        // 在主队列中执行没有问题
    });
    
    // 2 同步并发队列
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"2");
        dispatch_sync(concurrentQueue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");  // 执行结果是 1-2-3-4-5
    
    // 异步串行
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
    // 异步并发
    dispatch_async(concurrentQueue, ^{
        NSLog(@"1");
        [self performSelector:@selector(printLog)
                   withObject:nil
                   afterDelay:0];
        NSLog(@"3");
        /*
         执行结果是 1-3;
         GCD创建子线程默认没有开启runloop循环
         performSelector底层需要将Task加入到Runloop，，没有Runloop，
         因此不会打印2
         */
        
    });
    
    // 实现多读单写操作
     // dispatch_barrier_async + DISPATCH_QUEUE_CONCURRENT
    
}

- (void)printLog{
    NSLog(@"2");
}

@end
