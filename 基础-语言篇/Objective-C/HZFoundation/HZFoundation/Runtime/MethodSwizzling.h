//
//  MethodSwizzling.h
//  Runtime_总结
//
//  Created by apple on 15/8/31.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MethodSwizzling : NSObject
/*
    (1)
      在Objective-C中，运行时会自动调用每个类的两个方法。
      +load会在类初始加载时调用，
      +initialize会在第一次调用类的类方法或实例方法之前被调用。
 
    (2)
 选择器、方法与实现
 
 在Objective-C中，选择器(selector)、方法(method)和实现(implementation)是运行时中一个特殊点，虽然在一般情况下，这些术语更多的是用在消息发送的过程描述中。
 
 以下是Objective-C Runtime Reference中的对这几个术语一些描述：
 
 Selector(typedef struct objc_selector *SEL)：用于在运行时中表示一个方法的名称。一个方法选择器是一个C字符串，它是在Objective-C运行时被注册的。选择器由编译器生成，并且在类被加载时由运行时自动做映射操作。
 Method(typedef struct objc_method *Method)：在类定义中表示方法的类型
 Implementation(typedef id (*IMP)(id, SEL, …))：这是一个指针类型，指向方法实现函数的开始位置。这个函数使用为当前CPU架构实现的标准C调用规范。每一个参数是指向对象自身的指针(self)，第二个参数是方法选择器。然后是方法的实际参数。
 理解这几个术语之间的关系最好的方式是：一个类维护一个运行时可接收的消息分发表；分发表中的每个入口是一个方法(Method)，其中key是一个特定名称，即选择器(SEL)，其对应一个实现(IMP)，即指向底层C函数的指针。
 
 为了swizzle一个方法，我们可以在分发表中将一个方法的现有的选择器映射到不同的实现，而将该选择器对应的原始实现关联到一个新的选择器中。
 */


/*
 
 @implementation UIViewController (Tracking)
 
 + (void)load {
 static dispatch_once_t onceToken;
 dispatch_once(&onceToken, ^{
 Class class = [self class];
 // When swizzling a class method, use the following:
 // Class class = object_getClass((id)self);
 
 SEL originalSelector = @selector(viewWillAppear:);
 SEL swizzledSelector = @selector(xxx_viewWillAppear:);
 
 Method originalMethod = class_getInstanceMethod(class, originalSelector);
 Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
 
 //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
 BOOL didAddMethod =
 class_addMethod(class,
 originalSelector,
 method_getImplementation(swizzledMethod),
 method_getTypeEncoding(swizzledMethod));
 
 if (didAddMethod) {
 //如果成功，说明类中不存在这个方法的实现
 //将被交换方法的实现替换到这个并不存在的实现
 class_replaceMethod(class,
 swizzledSelector,
 method_getImplementation(originalMethod),
 method_getTypeEncoding(originalMethod));
 } else {
 method_exchangeImplementations(originalMethod, swizzledMethod);
 }
 });
 }

 
 #pragma mark - Method Swizzling
 
 - (void)xxx_viewWillAppear:(BOOL)animated {
 [self xxx_viewWillAppear:animated];
 NSLog(@"viewWillAppear: %@", self);
 }
 
 @end
 */

@end
