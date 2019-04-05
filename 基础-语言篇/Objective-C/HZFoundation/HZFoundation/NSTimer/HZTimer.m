//
//  HZTimer.m
//  HZFoundation
//
//  Created by KB on 2018/8/7.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZTimer.h"
#import "NSTimer+Weak.h"

@implementation HZTimer
-(void)test{
    /*
       在子线程中创建NSTimer，在将NSTimer加入到NSRunloop中后，如果不主动调用[[NSRunLoop currentRunLoop] run]；
       NSTimer后的回调方法是不会执行的；
     */
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSTimer * timer = [NSTimer timerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
            static int count = 0;
            [NSThread sleepForTimeInterval:1];
            //休息一秒钟，模拟耗时操作
            NSLog(@"%s - %d",__func__,count++);
        }];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        
        //子线程需要手动开启Runloop
        [[NSRunLoop currentRunLoop] run];
    });
}

- (void)test2{
//    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
//    [timer fire];
    
}



-(void)run{
    NSLog(@"======>:run");
}

- (void)test3{
    /*
        NSDefaultRunLoopMode  -------->  UITrackingRunLoopMode
        滚动视图会导致timer的回调不执行
     */
     NSLog(@"===>;test3");
}

-(void)test4{
    /*
       避免在使用NSTtimer时导致循环引用问题
       定义一个TimerWeakObject：该对象weak引用NSTimer和target对象
     */
   NSTimer *timer =  [NSTimer scheduledWeakTimerWithTimeInterval:1.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
   [timer fire];
}

@end
