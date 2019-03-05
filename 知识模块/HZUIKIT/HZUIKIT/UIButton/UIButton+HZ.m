//
//  UIButton+HZ.m
//  HZUIKIT
//
//  Created by dafy on 16/8/18.
//  Copyright © 2016年 HZ. All rights reserved.
/*
   https://bestswifter.com/efficient-rounded-corner/#
 */

#import "UIButton+HZ.h"

#import <objc/runtime.h>

@implementation UIButton (HZ)
//+(void)load{
//    Method originalMethod = class_getInstanceMethod([UIButton class], @selector(sendAction:to:forEvent:));
//    Method anotherMethod = class_getInstanceMethod([UIButton class], @selector(delaysendAction:to:forEvent:));
//    method_exchangeImplementations(originalMethod, anotherMethod);
//}

//
//-(void)delaysendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
//    [self delaysendAction:action to:target forEvent:event];
//    self.enabled = NO;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.enabled = YES;
//    });
//}
//
//-(void)setIsDelayClick:(BOOL)isDelayClick{
//    objc_setAssociatedObject(self, @selector(isDelayClick), @(isDelayClick), OBJC_ASSOCIATION_ASSIGN);
//}
//
//-(BOOL)isDelayClick{
//    return objc_getAssociatedObject(self, @selector(isDelayClick));
//}



@end
