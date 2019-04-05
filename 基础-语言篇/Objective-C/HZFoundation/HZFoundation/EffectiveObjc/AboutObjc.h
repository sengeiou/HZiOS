//
//  OboutObjc.h
//  Effective-ObjC
//
//  Created by apple on 16/2/13.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const AboutObjcNotificationName;

typedef NS_ENUM(NSInteger,HTTPMethod){
    GET,
    POST,
    DELETE
};

@interface AboutObjc : NSObject



/*
  Objective-C的起源
 
  (1)Objective-C是源自Smalltalk的一种面向对象的语言
  (2)Objective-C与其他面向对象语言的不同之处在于：Objective-C是采用的消息结构，
     借助于自身的runtime，运行期才检查数据类型，是一种动态语言；
     而其他面向对象的语言是采用函数调用的方式借助于编译器
  (3)内存管理上Objective-C采用引用计数的机制管理内存，而非其他面向对象的垃圾回收机制
  (4)Objective-C是C语言的超集；C语言的特性都适用于Objective-C
 */

/*
  类的头文件中尽量少引用其他头文件
 
 (1)引入其他头文件会增多编译的时间
 (2)在不需要知道类的具体实现的时候可以采用向前引用（@class）的方式解决
 (3)
 
 */


/*
    多使用字面量少用与之等价的方法
 (1)字符串字面量
     NSString* someString = @"some string";
 (2)字面数值(整数、浮点数、布尔值封装为Objective-C对象)
     NSNumber* intNumber = @1;
     NSNumber* floatNumber = @2.5f;
 (3) 字面量数组
     NSArray* animals = @[@"1",@"2",@"3"];//要检测每一个数据项是否为空值
     NSString* dog = animals[1];
 (4) 字面量字典
     NSDictionary* personData = @{@"1":"a",@"2":"b"};//键值和value都要检测
 */

/*
   多用类型常量，少用#define预处理指令
  (1)类内部使用采用如下定义方式
   static const NSTimeInterval kAnimationDuration = 0.3f;
   const:保证变量不被修改；
   static: 保证该变量只在声明的编译单元（每个类的实现单元）中可见
  (2)允许外部访问的采用如下定义
   头文件：
   extern NSString* const AboutObjcNotificationName;
   实现文件中：
   NSString* const AboutObjcNotificationName = @"notificationName";
  (3)使用#define定义的常量不包含类型信息
 
 */

/*
   使用枚举来列举状态值
 (1)NS_ENUM 定义普通枚举类型
 (2)switch 语句不要加default分支，这样增加新的枚举值的时候编译器才能提醒开发者
 */
@end
