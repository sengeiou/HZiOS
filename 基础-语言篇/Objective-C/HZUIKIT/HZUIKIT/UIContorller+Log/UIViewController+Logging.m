//
//  UIViewController+Logging.m
//  HZUIKIT
//
//  Created by apple on 16/8/31.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "UIViewController+Logging.h"
#import <objc/runtime.h>
#import "Logging.h"

@implementation UIViewController (Logging)
// 保证程序一运行就能实现方法的互换
+(void)load{
   // swizzleMethod([self class], @selector(viewWillAppear:), @selector(swizzled_viewDidAppear:));
}

//  交换两个指定的方法
void swizzleMethod(Class class,SEL originalSelector,SEL swizzledSelector){
    Method originalMethod  = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

// 切入执行逻辑
-(void)swizzled_viewDidAppear:(BOOL)animated{
    // 下面调用的其实是 -(void)viewWillAppear:(BOOL)animated
    [self swizzled_viewDidAppear:animated];
    //log逻辑
    [Logging logWithEventName:NSStringFromClass([self class])];
}

@end
