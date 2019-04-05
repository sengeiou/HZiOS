//
//  HZKVO.m
//  HZFoundation
//
//  Created by 华天杰 on 2018/7/8.
//  Copyright © 2018年 HZ. All rights reserved.
//


#import "HZKVO.h"

#import "HZMObject.h"
#import "HZObserveObj.h"

@interface HZKVO()

@end

@implementation HZKVO

-(void)test{

  
    HZMObject *mObj = [[HZMObject alloc] init];
    HZObserveObj *observerObj = [[HZObserveObj alloc] init];
    
    [mObj addObserver:observerObj
                  forKeyPath:@"value"
                     options:NSKeyValueObservingOptionNew
                     context:NULL];
    
    /*
      KVO 的大致实现原理（isa-swizling）：
      mObj 接收到 addObserver 后 系统会创建一个
      NSKVONotifying_HZMObject的类，继承自HZMObject；
      并且HZMObject的isa指针指向NSKVONotifying_HZMObject；
      然后再重写value属性的setter方法；完成值改变后的回调
     
     重写了setter方法后会在setter方法中调用如下代码：
     [self willChangeValueForKey:@"value"];
     [super setValue:obj];
     [self didChangeValueForKey:@"value"];
     
     */
    
    mObj.value = 1;
    
    /*
      1 通过KVC设置value，KVO的也会生效===》KVC最终会调用到setter方法
     
      2  通过成员变量赋值value KVO能否生效===》不能；
     
     */
    
   
    
    NSLog(@"d=======");
}

@end
