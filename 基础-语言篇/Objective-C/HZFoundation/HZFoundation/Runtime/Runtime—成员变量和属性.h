//
//  Runtime—成员变量和属性.h
//  Runtime_总结
//
//  Created by apple on 15/8/28.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>
@interface Runtime成员变量和属性 : NSObject

// 1
/*
 Ivar:表示实例变量的类型，是一个指向objc_ivar结构体的指针
 typedef struct objc_ivar *Ivar;
 struct objc_ivar {
     char *ivar_name                 OBJC2_UNAVAILABLE;
     // 变量名
     char *ivar_type                 OBJC2_UNAVAILABLE;
     // 变量类型
     int ivar_offset                 OBJC2_UNAVAILABLE;
     // 基地址偏移字节
     #ifdef __LP64__
     int space                       OBJC2_UNAVAILABLE;
     #endif
 }

 （1）objc_property_t 表示OC声明的属性的类型；
      typedef struct objc_property *objc_property_t;
 （2）objc_property_attribute_t： 表示属性的特性
    typedef struct {
    const char *name;
    // 特性名
    const char *value;
    // 特性值
    } objc_property_attribute_t;
 
  （3）关联对象（Associated Object）
     关联对象类似于成员变量，不过是在运行时添加的；可以动态的增加类现有的功能
    将一个对象关联到其他对象
    static char* myKey;
    objc_setAssociatedObject(self, &myKey, anObject, OBJC_ASSOCIATION_RETAIN);
 
   （4）
 //动态地将一个Tap手势操作连接到任何UIView中，并且根据需要制定点击后的实际操作
 - (void)setTapActionWithBlock:(void (^)(void))block
 {
 UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey);
 
 if (!gesture)
 {
 gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
 [self addGestureRecognizer:gesture];
 objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
 }
 
 objc_setAssociatedObject(self, &kDTActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
 }
 
 //手势识别需要的target和action
 - (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture
 {
     if (gesture.state == UIGestureRecognizerStateRecognized)
     {
     void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerTapBlockKey);
     
             if (action)
             {
             action();
             }
     }
 }
 
 */




// 3
/*
  (1)属性相关操作
 // 获取属性名
 const char * property_getName (objc_property_t property);
 
 // 获取属性特性描述字符串
 const char * property_getAttributes ( objc_property_t property );
 
 // 获取属性中指定的特性 （返回值使用后需要free()）
 char * property_copyAttributeValue ( objc_property_t property, const char *attributeName );
 
 // 获取属性的特性列表 （返回值使用后需要free()）
 objc_property_attribute_t * property_copyAttributeList ( objc_property_t property, unsigned int *outCount );

 */



@end
