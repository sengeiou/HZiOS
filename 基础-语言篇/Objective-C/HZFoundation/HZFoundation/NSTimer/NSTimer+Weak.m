//
//  NSTimer+Weak.m
//  HZFoundation
//
//  Created by KB on 2018/7/13.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "NSTimer+Weak.h"

@interface TimerWeakObject:NSObject

@property(nonatomic,weak)id target;
@property(nonatomic,weak)NSTimer *timer;
@property(nonatomic,assign)SEL selector;

-(void)fire:(NSTimer *)timer;

@end

@implementation TimerWeakObject
- (void)fire:(NSTimer *)timer{
    if (self.target) {
        if ([self.target respondsToSelector:self.selector]) {
            [self.target performSelector:self.selector withObject:self.timer.userInfo];
        }
    }
    else{
        [self.timer invalidate];
    }
}
@end

@implementation NSTimer (Weak)

+(NSTimer*)scheduledWeakTimerWithTimeInterval:(NSTimeInterval)ti
                                       target:(id)aTarget
                                     selector:(SEL)aSelector
                                     userInfo:(id)userInfo
                                      repeats:(BOOL)yesOrNo{
    TimerWeakObject *weakObject = [[TimerWeakObject alloc] init];
    weakObject.target = aTarget;
    weakObject.selector = aSelector;
    weakObject.timer = [NSTimer scheduledWeakTimerWithTimeInterval:ti
                                                            target:aTarget
                                                          selector:@selector(fire:)
                                                          userInfo:userInfo
                                                           repeats:yesOrNo];
    return weakObject.timer;
    
}

@end
