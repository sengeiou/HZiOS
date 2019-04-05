//
//  DFOne.h
//  Runtime_总结
//
//  Created by apple on 15/8/28.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>
//类只有实现NSCoding协议才能归档
@interface RTDFOne : NSObject<NSCoding>
@property(nonatomic,copy)NSString* name;
@property(nonatomic,assign)NSUInteger age;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,copy)NSString* graduateSchool;


/*
  <1>runtime是什么！？
     runtime是一套比较底层的纯C语言API，属于1个C语言库，包括很多底层的C语言API；
     平时编写的OC代码最终都会转化成runtime的C语言代码
  <2>runtime是用来做什么的？用在那些地方？怎么用？
     （1） KVO底层实现
     （2） 在类中动态添加属性方法，修改属性方法
     （3） 遍历属性列表，方法列表，实例列表
     （4） 对一个类的属性进行归档和解归档(类需要遵守NSCopying协议)
     （5） 对换两个方法的实现（swizzle）
        场景：对iOS7以上和iOS7以下的图片进行适配可以使用Swizzle来实现
 */
@end
