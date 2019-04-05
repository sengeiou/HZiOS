//
//  Blcoks.m
//  Effective-ObjC
//
//  Created by apple on 16/2/15.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "Blcoks.h"

typedef int(^BlcokNew)(BOOL isOk);

@implementation Blcoks
-(void)method{
  // 1 块的定义【block是将函数及其执行上下文封装起来的一个对象】
    
    void(^blcok)()=^{
        NSLog(@"block");
    };
    blcok();
    /*
     
     */
    int(^blcokAdd)(int a,int b)=^(int a,int b){
        return a+b ;
    };
    int sumNum = blcokAdd(1,2);
    
  /*
    2 block 与 Self的循环引用产生原因
     block会捕获self，但同时self中的对象也持有blcok【或者self持有block】那么就会产生循环引用问题；
     这事就需要弱化self
   */
    
    // 3 全局块、栈块及堆块
    // 1> 下列写法 block分配在栈上，超过作用域会被释放载调用stackBlock会引发异常
    BOOL isConditionOk = NO;
    void (^stackBlock)();
    if (isConditionOk) {
        stackBlock = ^{
            NSLog(@"if");
        };
    }else{
        stackBlock = ^{
            NSLog(@"else");
        };
    }
    stackBlock();
    
    // 解决上述问题需要 将栈上的block copy到堆上
    /*
     if (isConditionOk) {
     stackBlock = [^{
     NSLog(@"if");
     }copy];
     }else{
     stackBlock = [^{
     NSLog(@"else");
     } copy];
     }

     */
    
    //3 使用typedef定义块类型
    
    BlcokNew blockNew = ^(BOOL isOk){
        if (isOk) {
            return 1;
        }else{
            return 0;
        }
    };
    
    /*
       4 使用handler块降低代码分散程度
        1> 使用代理委托的方式在处理多个异步请求时回调需要区分请求对象，使得代码比较繁琐
        2> 使用block方式处理异步请求会将请求和回调的业务处理整合在一起；
        3> 使用blcok处理异步请求时可以将成功和失败情况放在一个handler中，这样便于业务处理；
         在发生错误时可以将获取的数据一并处理
     */
    
    /*
       5 用块引用其所属对象时不要出现循环引用
     */
    
    /*
       6 多用派发队列少用同步锁
       1> 多个线程要执行同一份代码时通常使用同步锁的机制处理
         @synchronized(self) {
         // safe code
         }
        
         NSLock 锁
         递归锁 NSRecursiveLock
     
        2> 使用GCD代替加锁的方案
        使用串行同步队列的方式保证属性setter和getter的线程安全
     */
    
    
}
@end
