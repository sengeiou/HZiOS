//
//  NSTimerRecycle.m
//  Effective-ObjC
//
//  Created by apple on 16/2/16.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "NSTimerRecycle.h"

@interface NSTimer (EOCBlcokSupport)
+(NSTimer*)eoc_scheduledTimerWithInterval:(NSTimeInterval)interval
                                    block:(void(^)())blcok
                                  repeats:(BOOL)repeats;
@end
@implementation NSTimer(EOCBlcokSupport)

+(NSTimer *)eoc_scheduledTimerWithInterval:(NSTimeInterval)interval
                                     block:(void (^)())blcok
                                   repeats:(BOOL)repeats{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(eoc_blcokInvoke:)
                                       userInfo:[blcok copy]
                                        repeats:repeats];
    
}

+(void)eoc_blcokInvoke:(NSTimer*)timer{
    void (^blcok)()=timer.userInfo;
    if (blcok) {
        blcok();
    }
}
@end


@implementation NSTimerRecycle{
    NSTimer* _pollTimer;
}

-(void)dealloc{
    [_pollTimer invalidate];
}

-(void)stopPolling{
   [_pollTimer invalidate];
    _pollTimer = nil;
}

-(void)startPolling{
    __weak NSTimerRecycle*weakSelf = self;
    _pollTimer = [NSTimer eoc_scheduledTimerWithInterval:5.0f block:^{
        NSTimerRecycle* strongSelf = weakSelf;
        [strongSelf p_dopoll];
    } repeats:YES];
}

-(void)p_dopoll{
  
}

/*
   (1)创建实例调用startPolling创建timer，因为target是self所以timer持有self，timer作为实例变量
 也被self持有，所以产生了循环引用（忘记调用stopPolling的情况下）；
   (2)
 */
@end

