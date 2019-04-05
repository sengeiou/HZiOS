//
//  HZPeople.m
//  HZFoundation
//
//  Created by apple on 16/8/31.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZPeople.h"
#import <objc/objc-runtime.h>

void reportFunction(id self,SEL _cmd){
    NSLog(@"This object is %p.", self);
    NSLog(@"Class is %@, and super is %@.", [self class], [self superclass]);
    
    Class currentClass = [self class];
    for (int i = 1; i < 5; i++)
    {
        NSLog(@"Following the isa pointer %d times gives %p", i, currentClass);
        currentClass = object_getClass(currentClass);
    }
    
    NSLog(@"NSObject's class is %p", [NSObject class]);
    NSLog(@"NSObject's meta class is %p", object_getClass([NSObject class]));
}

@implementation HZPeople



-(void)walk{
    NSLog(@"people walk!!");
}

void anotherPeopleWalk(id obj ,SEL _cmd){
    NSLog(@"anotherPeopleWalk!");
}


+ (BOOL)resolveClassMethod:(SEL)sel{
    return YES; // 类方法没有实现会调用
}

 // 方法没有实现会先调用
+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@"resolveInstanceMethod!");
    if (sel == @selector(walk)) {
        IMP fooIMP = imp_implementationWithBlock(^(id _self) {
            NSLog(@"Doing foo");
        });
        // 给类动态添加执行方法
        class_addMethod([self class], sel, fooIMP, "v@:");
      //  class_addMethod([self class], sel, (IMP)anotherPeopleWalk, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

// 没有实现 resolveInstanceMethod 则会调用forwardingTargetForSelector 允许将消息转发给指定的对象
-(id)forwardingTargetForSelector:(SEL)aSelector{
    if (aSelector == @selector(walk)) {
        return self.man;
    }
    return [super forwardingTargetForSelector:aSelector];
}


// 如果没有将消息转发给其他对象，最后的补救机会是forwardInvocation进行一次完整的消息转发
// 首先调用methodSignatureForSelector为执行方法完成签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature* signature = [super methodSignatureForSelector:aSelector];
    if(!signature){
        signature = [_man methodSignatureForSelector:aSelector];
    }
    return signature;
}
-(void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL sel = anInvocation.selector;
    if ([self .man respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:self.man];
    }else{
        [self doesNotRecognizeSelector:sel];
    }

}

/*
   类、对象、方法在objective-c中实质都是C语言的结构体类型
 
                 struct objc_class {
                             Class isa;//指针，顾名思义，表示是一个什么，
                             //实例的isa指向类对象，类对象的isa指向元类
                             #if !__OBJC2__
                             Class super_class;  //指向父类
                             const char *name;  //类名
                             long version;
                             long info;
                             long instance_size
                             struct objc_ivar_list *ivars //成员变量列表
                             struct objc_method_list **methodLists; //方法列表
                             struct objc_cache *cache;//缓存一种优化，调用过的方法存入缓存列表，下次调用先找缓存
                             struct objc_protocol_list *protocols //协议列表
                             #endif
                 } OBJC2_UNAVAILABLE;
 
                 struct objc_object {
                         Class isa  OBJC_ISA_AVAILABILITY;
                 };
 
                 struct objc_method {
                         SEL method_name                 OBJC2_UNAVAILABLE;  // 方法名
                         char *method_types                  OBJC2_UNAVAILABLE;
                         IMP method_imp                      OBJC2_UNAVAILABLE;  // 方法实现
                 }
 */

-(void)createClass{
    /*
       1：父类类型
       2：类名称
       3：在类和元类对象的末尾为索引的ivars分配的字节数 通常设置为0
     */
    Class HZArray = objc_allocateClassPair([NSArray class], "HZArray", 0);
    class_addMethod(HZArray, @selector(report), (IMP)reportFunction, "v@:");
    objc_registerClassPair(HZArray);
}

-(void)report{
    
}

@end
