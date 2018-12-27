//
//  HZMethodForwarding.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZMethodForwarding.h"

#import <objc/runtime.h>
#import "HZMethodTarget.h"

void hzMethod(){
    NSLog(@"hzMethod called");
}

@implementation HZMethodForwarding

// 动态方法解析
+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSString *methodName = NSStringFromSelector(sel);
    if ([methodName isEqualToString:@"hzMethod"]) {
        class_addMethod(self, sel, (IMP)hzMethod, "v@:");
    }
    return [super resolveInstanceMethod:sel];
}

// 将消息转发给承接对象
- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSString *methodName = NSStringFromSelector(aSelector);
    if ([methodName isEqualToString:@"hzMethod"]) {
       return [HZMethodTarget new];
    }
    return [super forwardingTargetForSelector:aSelector];
}


/*
 完成消息的最终转发是创建anInvocation
 */

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if ([HZMethodTarget instancesRespondToSelector:aSelector]) {
            signature = [HZMethodTarget instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    if ([HZMethodTarget instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:[HZMethodTarget new]];
    }
}

@end
