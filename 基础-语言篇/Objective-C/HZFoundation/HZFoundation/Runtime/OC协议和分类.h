//
//  OC协议和分类.h
//  Runtime_总结
//
//  Created by apple on 15/8/31.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OC_____ : NSObject
/*
  // 基础数据类型
   （1）Category：一个指向分类的结构体的指针

         typedef struct objc_category *Category;
         
         struct objc_category {
             char *category_name                          OBJC2_UNAVAILABLE; // 分类名
             char *class_name                             OBJC2_UNAVAILABLE; // 分类所属的类名
             struct objc_method_list *instance_methods    OBJC2_UNAVAILABLE; // 实例方法列表
             struct objc_method_list *class_methods       OBJC2_UNAVAILABLE; // 类方法列表
             struct objc_protocol_list *protocols         OBJC2_UNAVAILABLE; // 分类所实现的协议列表
        }
    （2）Protocol：其实就是一个对象结构体
        typedef struct objc_object Protocol;
 */
@end
