//
//  HZThreadLock.m
//  HZFoundation
//
//  Created by KB on 2018/8/8.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZThreadLock.h"

@implementation HZThreadLock
- (void)test{
    // 1 创建单例对象保证线程安全
    @synchronized(self){
        
    }
    // 2 属性关键字，
    // atomic
    self.array = [NSMutableArray array];// 线程安全
    [self.array addObject:@"1"];// 线程不安全
    
    // 3 自旋锁： 循环等待询问，不释放当前资源【类似while循环】
     // OSSpinLock
    // 用于轻量级数据访问。retainCount +1/-1
    
    //4
    // NSLock
     /*
      // A方法调用会导致死锁
      -(void)A{
         [lock lock];
         [self methodB];
         [lock unlock];
      }
      
      -(void)B{
        [lock lock];
         // 操作逻辑
        [lock unlock];
      }
      */
    
    // 5 递归锁
    // NSRecursiveLock
    /*
     // A方法调用会导致死锁
     -(void)A{
         [RecursiveLock lock];
         [self methodB];
         [RecursiveLock unlock];
     }
     
     -(void)B{
         [RecursiveLock lock];
         // 操作逻辑
         [RecursiveLock unlock];
     }
     */
    
     // 6 信号量
     //dispatch_semaphore_t
    /*
     (1)   dispatch_semaphore_create(<#long value#>)
        struct semaphore {
            int value;
            List<thread>; // 线程队列
        };
     
      (2)   dispatch_semaphore_wait(){
         S.value = S.value -1 ;
         if S.value < 0 then Block(S.list) ==> 阻塞是一个主动的行为
         }
     
     (3)  dispatch_semaphore_signal(){
             S.value = S.value + 1;
             if S.value <= 0 then wakeup(S.list); ==> 唤醒是一个被动行为
          }
     
     */
    
 
    
    
}
@end
