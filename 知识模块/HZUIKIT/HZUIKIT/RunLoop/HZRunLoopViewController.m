//
//  HZRunLoopViewController.m
//  HZUIKIT
//
//  Created by dafy on 16/8/17.
//  Copyright © 2016年 HZ. All rights reserved.
/*
   http://blog.ibireme.com/2015/05/18/runloop/
 */

#import "HZRunLoopViewController.h"
#import "HZThread.h"

@interface HZRunLoopViewController ()
@property(nonatomic,strong)HZThread* thread;
@end

@implementation HZRunLoopViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    

    
    
}





#pragma mark -- 如何实现一个常驻线程 （AFN在后台接收）

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self performSelector:@selector(showTouchEvent) onThread:self.thread withObject:nil waitUntilDone:NO];
}

-(void)createThread{
    HZThread* thread = [[HZThread alloc] initWithTarget:self selector:@selector(createLongThread) object:nil];
    self.thread = thread;
    [thread start];
}

-(void)createLongThread{
    @autoreleasepool {
        NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
        [currentRunLoop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
        [currentRunLoop run];
    }
}

-(void)showTouchEvent{
    NSLog(@"当前mode:%@",[NSRunLoop currentRunLoop].currentMode);
    NSLog(@"执行前线程:%@",[NSThread currentThread]);
    [NSThread sleepForTimeInterval:3.0f];
    NSLog(@"执行后线程:%@",[NSThread currentThread]);
}

-(void)timerAction{
    //NSPushAutoreleasePool
    NSLog(@"timerAction!!!!");
    //NSPopAutoreleasePool
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
