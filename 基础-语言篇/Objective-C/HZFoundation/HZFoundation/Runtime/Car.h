//
//  Car.h
//  HZFoundation
//
//  Created by KB on 2018/4/9.
//  Copyright © 2018年 HZ. All rights reserved.

/*
 （一）Objectice-C 基础
  + 类 对象
  + 属性
  + 方法
  + 协议
  + 分类
  + 内存管理相关
  + @synthesize 和 @dynamic
  + runtime
 
  + id {}和instancetype区别
  + static、const 宏
  + kvc 和 kvo 实现原理
  + 深浅拷贝
  + 序列化与反序列化
  + GCD NSOperation NSThread 多线程编程
  + Block
  + MD5 、RSA、DES 、AES 、Base64
 */

#import <Foundation/Foundation.h>

#pragma mark -- 协议

@class Car;
@protocol CarDriveDelegate<NSObject>
@optional
-(void)refitCar:(Car*)car ;//
@end

@interface Car : NSObject{// 实例变量
    NSString* _name;
    NSString* _color;
}
// 属性
@property(nonatomic,copy)NSString * model;
@property(nonatomic,copy)NSString * carVersion;
// 代理
@property(nonatomic,weak)id<CarDriveDelegate> delegate;

#pragma mark -- getter和setter方法

-(NSString*)name;
-(void)setName:(NSString*)name;

-(NSString*)color;
-(void)setColor:(NSString*)color;

#pragma mark -- 实例方法和类方法

-(void)move;
+(instancetype)carWithInformation:(NSDictionary*)infor;

@end

#pragma mark -- 分类

@interface Car(HZ)
-(void)automaticDrive;
@end

