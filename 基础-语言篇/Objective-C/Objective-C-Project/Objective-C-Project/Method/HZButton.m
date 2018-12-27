//
//  HZButton.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/27.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZButton.h"
#import <objc/runtime.h>

static  NSString * K_HZ_BUTTON_TIMESTAMP_KEY = @"hz_ButtonTimeStamp";

@interface HZButton()
@property(nonatomic,assign)BOOL isDelay;

@end

@implementation HZButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        _clickInterval = 0;
        _isDelay = NO;
    }
    return self;
}

+(void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        SEL sendAction = @selector(sendAction:to:forEvent:);
//        SEL hzSendAction = @selector(hz_sendAction:to:forEvent:);
//        
//        Method sendActionMethod = class_getInstanceMethod([self class], sendAction);
//        Method hzSendActionMethod = class_getInstanceMethod([self class], hzSendAction);
//        
//        method_exchangeImplementations(sendActionMethod, hzSendActionMethod);
//    });
}

/*
  实现按钮的连续点击事件
  1> 拦截按钮点击事件
  2> 比较两次时间差值
  3> 如果时间
 */
-(void)hz_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    // 时间差值比较
//    NSDate *currentDate = [NSDate date];
//    NSDate *lastDate = [[NSUserDefaults standardUserDefaults] objectForKey:K_HZ_BUTTON_TIMESTAMP_KEY];
//    NSTimeInterval interval = [currentDate timeIntervalSinceDate:lastDate];
//    if (interval < 4) {
//        NSLog(@"button repeat click");
//        return;
//    }
//    [[NSUserDefaults standardUserDefaults] setObject:currentDate forKey:K_HZ_BUTTON_TIMESTAMP_KEY];
    if (self.isDelay) {
        NSLog(@"button repeat click");
        return;
    }
    if (self.clickInterval>0) {
        self.isDelay = YES;
        [self performSelector:@selector(resetIsDelayState) withObject:nil afterDelay:self.clickInterval];
    }
    [self hz_sendAction:action to:target forEvent:event];
}

-(void)resetIsDelayState{
    self.isDelay = NO;
}
@end
