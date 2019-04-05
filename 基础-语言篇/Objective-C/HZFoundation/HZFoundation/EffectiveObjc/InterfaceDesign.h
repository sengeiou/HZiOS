//
//  InterfaceDesign.h
//  Effective-ObjC
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InterfaceDesign : NSObject

/*
   使用前缀避免命名空间冲突
   (1)类名前加特殊含义的前缀
 */

/*
   全能初始化方法
  (1)-init 调用全能初始化方法
  (2)子类自定义初始化方法，并调用父类全能初始化方法；为避免子类调用父类
   的初始化方法，子类要重写父类的初始化方法；
 */

/*
   重写 description方法可以便于在调试的时候详细展示对象信息
 */

/*
   尽量使用不可变对象
   (1)尽量把对外公布的信息设置为只读
   (2)尽量创建不可变对象
   (3)不要把可变的集合类型作为属性公开，而是提供方法修改对象中可变的集合
   (4)有时想在类的内部修改属性而不想外部修改，此时可以在分类中重新定义属性的读写权限
 */

/*
   使用清晰而协调的命名方式
   (1)驼峰命名方法
   (2)语义表示清晰
   (3)避免使用缩写
 */

/*
   给私有方法加前缀（p_method）
 */

/*
   Objective-C 的错误模型
   (1)Objective-C 基本不抛异常的原因是防止异常抛出后该释放的对象未被释放；
   (2)NSError 的使用
  */

@end
