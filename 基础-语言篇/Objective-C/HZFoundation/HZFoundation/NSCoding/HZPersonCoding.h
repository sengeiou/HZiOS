//
//  HZPersonCoding.h
//  HZFoundation
//
//  Created by apple on 16/12/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
   (1)序列化的作用
        将对象以二进制数据流的形式保存在本地；保存序列化，取数据即是反序列化
   (2)NSCoder 和 NSCoding协议
         NScoding 是一个协议，主要有下面两个方法
         -(id)initWithCoder:(NSCoder *)coder;//从coder中读取数据，保存到相应的变量中，即反序列化数据
         -(void)encodeWithCoder:(NSCoder *)coder;// 读取实例变量，并把这些数据写到coder中去。序列化数据
         NSCoder 是一个抽象类，抽象类不能被实例话，只能提供一些想让子类继承的方法。
         NSKeyedUnarchiver   从二进制流读取对象。
         NSKeyedArchiver       把对象写到二进制流中去。
 */
@interface HZPersonCoding : NSObject<NSCoding>
@property(nonatomic,copy)NSString* name;
@property(nonatomic,assign)NSInteger age;
@end
