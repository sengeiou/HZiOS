//
//  HZMethod.m
//  HZFoundation
//
//  Created by KB on 2018/4/10.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZMethod.h"
#import <objc/runtime.h>
#import "HZMethodHelper.h"

void funcForMethod(id self,SEL _cmd){
    NSLog(@"funcForMethod");
}

@interface HZMethod(){
    HZMethodHelper* _methodHelper;
}
@end

@implementation HZMethod

- (instancetype)init
{
    self = [super init];
    if (self) {
        _methodHelper =[HZMethodHelper new];
    }
    return self;
}

-(void)test{
    /*
       method1 并没有在 HZMethod类中声明并实现；
       此时会调用resolveInstanceMethod
       如果利用class_addMethod动态添加方法则会调用新增的method
     */
    [self performSelector:@selector(method1)];
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSString* selString = NSStringFromSelector(sel);
    if ([selString isEqualToString:@"method1"]) {
        class_addMethod([self class], @selector(method1), (IMP)funcForMethod, "@:");
    }
   return  [super resolveInstanceMethod:sel];
}


/*
   将调的消息转发给另外一个对象去响应
 */
-(id)forwardingTargetForSelector:(SEL)aSelector{
    NSString* selStr = NSStringFromSelector(aSelector);
    if ([selStr isEqualToString:@"method1"]) {
        return _methodHelper;
    }
    return [super forwardingTargetForSelector:aSelector];
}


/*
  完成消息的最终转发是创建anInvocation
 */

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if ([HZMethodHelper instancesRespondToSelector:aSelector]) {
            signature = [HZMethodHelper instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}


-(void)forwardInvocation:(NSInvocation *)anInvocation{
    if ([HZMethodHelper instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:_methodHelper];
    }
}

@end
