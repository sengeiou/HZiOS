//
//  HZObjClass.h
//  HZFoundation
//
//  Created by apple on 16/12/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZObjClass : NSObject

@property(nonatomic,copy)NSString* name;
// 自定义getter的方式
@property (getter=isFinished) BOOL finished;

// 实例方法 
-(void)instanceMethod;
// 静态方法或是类方法
+(void)staticMethod;
@end

/*
 @property 的属性：
 readwrite 是可读可写特性；需要生成 getter 方法和 setter 方法
 readonly 是只读特性，只会生成 getter 方法 不会生成 setter 方法，不希望属性在类外改变时使用
 assign/weak 是赋值特性，setter 方法将传入参数赋值给实例变量；仅设置变量时；weak当所指对象被释放时指针自动置为nil
 retain/strong  表示持有特性，setter 方法将传入参数先保留，再赋值，传入参数的 retain count 会+1;
 copy 表示拷贝特性，setter 方法将传入对象复制一份；需要完全一份新的变量时。
 nonatomic 和 atomic ，决定编译器生成的 setter getter是否是原子操作。 atomic 表示使用原子操作，可以在一定程度上保证线程安全。一般推荐使用 nonatomic ，因为 nonatomic 编译出的代码更快
 */

