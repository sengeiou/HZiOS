//
//  HZObjClass.m
//  HZFoundation
//
//  Created by apple on 16/12/7.
//  Copyright © 2016年 HZ. All rights reserved.
/*
 #import是Objective-C导入头文件的关键字，
 #include是C/C++导入头文件的关键字
 使用#import头文件会自动只导入一次，不会重复导入，相当于#include和#pragma once；
 @class告诉编译器需要知道某个类的声明，可以解决头文件的相互包含问题
 */

#import "HZObjClass.h"
// 匿名类别或是Extension
@interface HZObjClass()

@end
// 在类中新增全局变量
static NSOperationQueue * _personOperationQueue = nil;
@implementation HZObjClass

+(void)load{
  /*
     +load的调用是在类文件或是分类文件加入Runtime中时调用，且仅调用一次
     作用：可以在此实现方法的互换（Method Swizzling）
   */
}
+(void)initialize {
   /*
      +initialize 方法是在类或它的子类收到第一条消息之前被调用的，这里所指的消息包括实例方法和类方法的调用
      作用：可以初始化一些全局变量
    */
}

/* 
 将name和_name绑定
 protocol 中定义的属性，编译器不会自动 synthesize，需要手动写
 当重载父类中的属性时，也必须手动写 synthesize
 */
@synthesize name = _name;
// @dynamic 显式要求不希望编译器生成getter和setter方法

-(NSString*)name{
    return _name;
}

-(void)setName:(NSString *)name{
    if (_name != name) {
        _name = [name copy];
    }
}
@end

@interface HZObjClass(HUA)
-(void)newAddMethod;
@end

