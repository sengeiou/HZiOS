//
//  方法和消息.h
//  Runtime_总结
//
//  Created by apple on 15/8/31.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface _____ : NSObject



/*
   基础数据类型
   （1）SEL：选择器，是表示一个方法的selector的指针
    typedef struct objc_selector *SEL;
    Objective-C在编译时，会依据每一个方法的名字、参数序列，生成一个唯一的整型标识(Int类型的地址)，这个标识就是SEL
    本质上，SEL只是一个指向方法的指针（准确的说，只是一个根据方法名hash化了的KEY值，能唯一代表一个方法），它的存在只是为了加快方法的查询速度。
 
   （2）IMP：实际上是一个函数指针，指向方法实现的首地址
     id (*IMP)(id, SEL, ...)
     参数1：实例方法或者是类方法 分别代表类实例的内存地址或是指向原类的指针,
 
    （3）Method ：表示类定义的方法
     typedef struct objc_method *Method;
     
     struct objc_method {
     SEL method_name                 OBJC2_UNAVAILABLE;  // 方法名
     char *method_types                  OBJC2_UNAVAILABLE;
     IMP method_imp                      OBJC2_UNAVAILABLE;  // 方法实现
}
     （4）方法调用的流程
     
     （5）获取方法地址
    如果想要避开这种动态绑定方式，我们可以获取方法实现的地址，然后像调用函数一样来直接调用它。特别是当我们需要在一个循环内频繁地调用一个特定的方法时，通过这种方式可以提高程序的性能。

    NSObject类提供了methodForSelector:方法，让我们可以获取到方法的指针，然后通过这个指针来调用实现代码。我们需要将methodForSelector:返回的指针转换为合适的函数类型，函数参数和返回值都需要匹配上。
 
           // 具体实现
             void (*setter)(id, SEL, BOOL);//函数指针的前两个参数必须是id和SEL。
             int i;
             
             setter = (void (*)(id, SEL, BOOL))[target
             methodForSelector:@selector(setFilled:)];
             for ( i = 0 ; i < 1000 ; i++ )
             setter(targetList[i], @selector(setFilled:), YES);
 
      (6)消息转发
          1 动态方法解析
            对象在接收到未知的消息时，首先会调用所属类的类方法+resolveInstanceMethod:(实例方法)或者+resolveClassMethod:(类方法)。在这个方法中，我们有机会为该未知消息新增一个”处理方法”“。不过使用该方法的前提是我们已经实现了该”处理方法”，只需要在运行时通过class_addMethod函数动态添加到类里面就可以了
          2 备用接受者
           // 如果上一步无法处理则会执行(只能够把消息转给能够处理的对象去操作)
           - (id)forwardingTargetForSelector:(SEL)aSelector

          3 完整转发
          // 如果在上一步还不能处理未知消息，则唯一能做的就是启用完整的消息转发机制了
          - (void)forwardInvocation:(NSInvocation *)anInvocation
 
              //消息转发机制使用从这个方法中获取的信息来创建NSInvocation对象。因此我们必须重写这个方法，为给定的selector提供一个合适的方法签名。
             - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
                 NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
              
                 if (!signature) {
                     if ([SUTRuntimeMethodHelper instancesRespondToSelector:aSelector]) {
                         signature = [SUTRuntimeMethodHelper instanceMethodSignatureForSelector:aSelector];
                     }
                 }
              
                 return signature;
             }
              
             - (void)forwardInvocation:(NSInvocation *)anInvocation {
                 if ([SUTRuntimeMethodHelper instancesRespondToSelector:anInvocation.selector]) {
                     [anInvocation invokeWithTarget:_helper];
                 }
             }
 
    （7）使用消息转发可以实现一个对象拥有其他对象的方法；增强对象的功能
 
 */



@end
