//
//  HZThread.m
//  HZFoundation
//
//  Created by KB on 2018/8/7.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZThread.h"

@implementation HZThread

-(void)test{
    
}

-(void)test1{
    NSLog(@"run===>before");
    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
    NSLog(@"run===>after");
}

- (void)run{
    NSThread *thread = [NSThread currentThread];
    thread.name = @"testThread";
    NSLog(@"%@====>:%@===%@",[NSThread mainThread],thread,thread.threadDictionary);
    /*
      run ===> before
      run ===> after
      run ===> 12345
      <NSThread: 0x100600a70>{number = 1, name = (null)}====>:
      <NSThread: 0x1005057e0>{number = 2, name = (null)}
     */
}

@end
