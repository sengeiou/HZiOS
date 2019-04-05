//
//  AssociatedObject.h
//  Effective-ObjC
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AssociatedObject : NSObject
/*
    objc_msgSend 的理解：
   (1) [someobject sendMsg:param];=>本质上是转化成objc_msgsend(someobject,selector(sendMsg),param);
   (2)消息的传递：首先会是在当前对象的类中查找方法列表，若是没有找到会向父类中查找，若没有则消息转发，如若没有报异常信息
 */

/*
    理解消息转发(message forwarding)机制
   (1)通过消息转发，程序员告知对象应该如何处理未知消息
   (2)
      1>对象收到无法解析的方法后首先会调用： resolveInstanceMethod:(SEL)method => 是否向该对象所在的类中动态添加方法； (class_addMethod)
      2>备用接收者(将消息转给其他对象处理)
       forwardingTargetForSelector:(SEL)selector
      3>完整消息转发是没有备用接收者的状态下
       forwardInvocation:(NSInvocation*)invocation
       只需要改变消息目标，在新目标上进行消息传递
 
 */

 /*
    方法调配(method swizzling)
    1> 交换两个方法
    void method_exchangeImplementations(Method m1,Mehod m2)
    2> 方法实现通过
     Method class_getInstanceMethod(Class aClass,SEL selector)
    3> 为完全不知道实现的黑盒方法增加日志功能、向原有方法中添加新功能
    尽量少使用该方法（代码不易阅读，难以维护）
  */


  /*
     理解类对象(Class对象)
     (1) Objective-C对象的本质是指向某块内存数据的指针
        NSString* string = @"string";
   
      // 类型信息查询方法
     (2) isMemberOfClass: 判断对象是否是某类的实例
     (3) isKindOfClass: 判断对象是否是某类或是
    
   
      typedef struct objc_class *Class;
      struct objc_class{
        Class isa; // 实例所属的类
        Class super_class; //继承关系
        const char* name;
        long version;
        long info;
        long instane_size;
        struct objc_ivar_list *ivars;
        struct objc_method_list **methodList;
        struct objc_cache* cache;
        struct objc_protovol_list *protocls;
      }
   
   */
@end
