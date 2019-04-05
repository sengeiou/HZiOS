//
//  DFTwo.h
//  Runtime_总结
//
//  Created by apple on 15/8/28.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RTDFTwo : NSObject
/*
   (1)OC语言是一门动态语言，他将静态语言在编译和链接时期所做的事情放在运行时来处理，这样就可以使得编写代码更加灵活性
  （2）OC 编译器 + 运行时系统（obj runtime）
  （3）objc_object 是一个类的实例的结构体 内部只有一个isa成员
     当向该对象发送消息时根据isa指针找到对应的类，找到方法列表或查询父类的方法列表
  （4）objc_cache 用于缓存使用过的方法
   （5）元类（Meta Class）
 */



/*
    类与对象操作函数
 */


@end
