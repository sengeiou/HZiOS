//
//  UIViewController+Tracking.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/26.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <objc/runtime.h>

@implementation UIViewController (Tracking)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(tracking_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}



#pragma mark - Method Swizzling

- (void)tracking_viewWillAppear:(BOOL)animated {
    NSLog(@"Method Swizzling viewWillAppear: %@", self);
    [self tracking_viewWillAppear:animated];
}

@end
