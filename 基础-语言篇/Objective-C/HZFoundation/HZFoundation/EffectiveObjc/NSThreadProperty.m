//
//  NSThreadProperty.m
//  Effective-ObjC
//
//  Created by apple on 16/2/16.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "NSThreadProperty.h"

@interface NSThreadProperty(){
    dispatch_queue_t _syncQueue;
    dispatch_queue_t _globalQueue;
}

@end

@implementation NSThreadProperty

@synthesize someString = _someString;
@synthesize otherString= _otherString;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _syncQueue   = dispatch_queue_create("serialQueue", NULL);
        _globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    return self;
}

-(void)sychronizationedMethod{
    
    @synchronized(self) {
        /*
          使用同步代码块来处理多线程访问问题的弊端：
          首先根据给定的对象(self)生成一个锁，然后等待代码块中代码执行完毕；
           这样会降低代码效率，对self频繁的加锁可能会使程序要等待一段无关的代码执行完毕才能继续执行；
         */
    }
}

/*
   串行同步队列
   这样设置和获取属性的操作都放在同步队列里面，这样所有针对属性的操作都同步了；
 */
-(NSString *)someString{
    __block NSString* localSomeString;
    dispatch_sync(_syncQueue, ^{
        localSomeString = _someString;
    });
    return localSomeString;
}

-(void)setSomeString:(NSString *)someString{
    dispatch_sync(_syncQueue, ^{
        _someString = someString ;
    });
}

/*
    并发队列+栅栏
    在队列中栅栏块必须单独执行，而且只对并发队列有作用
    当并发队列发现有栅栏块时，会将当前正在执行的并发任务执行完毕，再单独执行栅栏块，当栅栏
   块执行完毕后再执行其他并发任务
 */
-(NSString*)otherString{
    __block NSString* localString = nil;
    dispatch_sync(_globalQueue, ^{
        localString = _otherString;
    });
    return localString;
}
-(void)setOtherString:(NSString *)otherString{
      dispatch_barrier_async(_globalQueue, ^{
          _otherString = otherString;
      });
}


/*
   避免使用performSelector来执行方法，会有潜在的内存泄露问题出现
 */

-(void)testMethod{
    //延迟执行某项任务
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5*NSEC_PER_SEC));
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [self doSomeThing];
    });
}

-(void)doSomeThing{
    // 把任务放在主线程中
    dispatch_async(dispatch_get_main_queue(), ^{
        // do some things
    });
}

/*
   NSOperationQueue的好处：
   1> 取消某个操作，直接调用cancle就可以了
   2> 指定操作间的依赖关系
   3> 通过键值观察监测NSOperation之间的关系
   4> 指定操作的优先级
 */


/*
    dispatch_group的用法
 */
-(void)doOtherThing{
    NSArray* objArray = nil;
    dispatch_queue_t  goalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t dispatch_group = dispatch_group_create();
    for (id object in objArray) {
        dispatch_group_async(dispatch_group, goalQueue, ^{
           // do some thing
        });
    }
    
    // 堵塞线程使用下列方案
    dispatch_group_wait(dispatch_group, DISPATCH_TIME_FOREVER);
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    // 不堵塞线程使用如下方案
    dispatch_group_notify(dispatch_group, mainQueue, ^{
         // task all finished do other thing
    });
    
    // 有时采用单个serial queue异步派发同样能替代dispatch_group
}

-(void)doAnotherThing{
  // 遍历某个colletion，并在元素上执行操作
    dispatch_queue_t queue = dispatch_queue_create("queue", NULL);
    dispatch_apply(10, queue, ^(size_t index) {
        // do some to index
    });
    // dispatch_apply 会持续堵塞线程

}

// dispatch_once 来执行运行一次的线程安全代码
+(instancetype)shareInstance{
    static NSThreadProperty* shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}


/*
   构建缓存应该优先使用NSCache而不是NSDictionary
   原因是：NSCache在收到内存警告时，会自动减持缓存
 */

/*
   + (void)load;
  对于加入运行期系统的类或是分类必定会调用此方法，而且仅仅调用一次
   +(void)initialize;
  这个方法会在程序首次使用该类时调用，而且只会调用一次
 */


@end
