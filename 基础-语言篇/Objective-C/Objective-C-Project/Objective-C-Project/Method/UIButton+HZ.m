//
//  UIButton+HZ.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/27.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "UIButton+HZ.h"
#import <objc/runtime.h>


static char *const k_isEnableClick = "isEnableClick";
static char *const k_clickInterval = "k_clickInterval";

@interface UIButton()

@property(nonatomic,assign)BOOL enableClick;

@end

@implementation UIButton (HZ)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL sendAction = @selector(sendAction:to:forEvent:);
        SEL hzSendAction = @selector(hz_sendAction:to:forEvent:);
        
        Method sendActionMethod = class_getInstanceMethod([self class], sendAction);
        Method hzSendActionMethod = class_getInstanceMethod([self class], hzSendAction);

        method_exchangeImplementations(sendActionMethod, hzSendActionMethod);
    });
}

-(void)hz_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (!self.enableClick) {
        self.enableClick = YES;
        [self performSelector:@selector(setEnableClick:) withObject:@(NO) afterDelay:self.clickInterval];
        [self hz_sendAction:action to:target forEvent:event];
    }else{
        NSLog(@"repeat click!!");
    }
}

-(NSTimeInterval)clickInterval{
    return [objc_getAssociatedObject(self, k_clickInterval) doubleValue];
}

-(void)setClickInterval:(NSTimeInterval)clickInterval{
    objc_setAssociatedObject(self, k_clickInterval, @(clickInterval), OBJC_ASSOCIATION_ASSIGN);
}

-(void)setEnableClick:(BOOL)isEnableClick{
    objc_setAssociatedObject(self, k_isEnableClick, @(isEnableClick), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)enableClick{
    return [objc_getAssociatedObject(self, k_isEnableClick) boolValue];
}
@end
