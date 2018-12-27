//
//  HZProperty.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/24.
//  Copyright © 2018年 HZ. All rights reserved.

/*
 
 
  （1）@property的三个作用：
   + 生成实例变量 _propertyName
   + 生成setter方法
   + 生成getter方法
 
  （2） 当重写setter和getter方法时，编译器会报错_propertyName未定义，
   此时需要使用@synthesize来合成 propertyName = _propertyName；
 
  （3） @dynamic:  告知编译器setter和getter方法不需要自动生成
 
  （4）比较assign和weak的差别
   + assign修饰基本数据类型，weak修饰object type
   + 修饰对象使用weak，当对象被释放时，对象指针会被置为nil，使用assign则不会
 
  （5）深浅拷贝 、自定义对象的拷贝
     + copy
      - 不可变对象{NSString/NSArray/NSDictionary} : 浅拷贝，堆上不开辟新空间，得到的也是不可变对象
      - 可变对象 {NSMutableString/NSMutableArray/NSMutableDictionary}:深拷贝，堆上开辟空间，得到的是不可变对象
     + mutableCopy：对于可变/不可变对象来说都是深拷贝，堆上开辟新空间，得到的是可变对象
     + 能否对一些不可变对象使用strong关键词修饰？
       不可以，当指针从不可变对象，改为指向可变对象时，数据发生改变，可能会造成不可预知的问题
     + 自定义对象的实现拷贝
       
 
  （6）copy / strong MRC下的setter方法重写
 
  （7）weak的使用 （场景、实现原理）
 
   (8)分类、协议中属性的使用
    + 分类中正常不能添加属性，但可以通过联合的方式添加
    + 协议中很少使用
 
  （9）KVC&KVO 对属性的赋值和监控
 
   (10)属性的读写/线程安全（实现属性的访问安全） -- 涉及各种锁的使用
 
 */

#import "HZProperty.h"

@interface HZProperty()<NSCopying>
{
    NSString *_address;
}
@end

@implementation HZProperty
@synthesize name = _name;
@dynamic address;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setName:(NSString *)name{
    _name = name;
}

-(NSString *)name{
    return _name;
}

- (void)setAddress:(NSString *)address{
    _address = address;
}

- (NSString*)address{
    return _address;
}

-(void)test{
    NSArray * tempArray = @[@"1",@"2",@"3"];
    self.houseArray = tempArray;// self.houseArray为不可变数组
    
    //self.houseArray 指向一个可变数组，如果可变数组内容发生变化，self.houseArray也会发生变化
    self.houseArray = [NSMutableArray arrayWithObject:@"1"];
    
   // NSLog(@"%@",self.houseArray[2]); // 会引发崩溃,数组越界
}

-(instancetype)initWithName:(NSString*)name address:(NSString*)address houseArray:(NSArray*)houseArray{
    self = [super init];
    if (self) {
        _name = name;
        _address = address;
        _houseArray = houseArray;
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    HZProperty * pro = [[HZProperty allocWithZone:zone] initWithName:self.name address:self.address houseArray:self.houseArray];
    return pro;
}
@end
