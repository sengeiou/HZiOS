//
//  Property.h
//  Effective-ObjC
//
//  Created by apple on 16/2/13.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Property : NSObject




/*
 
   ABI：应用程序二进制接口
 
    + 对象： 存储并传递数据
    + 消息传递 ： 对象之间传递数据并执行任务的过程
    + runtime：提供对象之间消息传递的函数，创建类实例所需要的逻辑
 
 
    了解属性
   (1)@property: 编译器会自动生成setter和getter方法，同时生成一个实例变量；
   也可以使用`@synthesize firstName = _myFirstName;`修改编译器创建的实例变量名为_myFirstName；同时
 如果不想让编译器生成getter/setter方法可以使用@dynamic;例如`@dynamic firstName;`编译器就不会为这个类生成实例变量和存取方法；额
 
   (2)属性的特质：属性的特质会影响编译器生成的存取方法
     1> 原子性（nonatomic/atomic）：默认是atomic，涉及多线程
     2> 读写权限（readwrite/readonly）:
     3> 内存管理问题(会影响属性设置方法的实现)：
        assign:对基本的数据类型做简单的赋值操作
        strong:表示一种拥有关系为这种属性设置值时会先保留新值，释放旧值，在把新值设置上去
             -(void)setObject:(Type)object{
                 if(_object!=object){
                   [_object release];
                   _object = object;
                 }
             }
        weak: 表示一种非拥有关系，基本用于代理或解决循环引用上，指向的对象被释放后自动置为nil；用法与assign基本类似
        copy：设置方法并不保留新值，而是将其拷贝{NSString为什么使用copy属性特质：设置方法传递的值可能是一个可变的NSMutableString，可变字符串一旦修改会导致属性的值被修改，所以为了保证属性不被修改所以才拷贝一份不可变的String值}
 
 */

/*
   在对象内部尽量直接访问实例变量（何时使用实例变量，何时使用属性）
   方案：
     设置值的时候使用属性，获取值的时候使用实例变量；
     1> 子类重写了设置方法，那么在父类的初始化方法中应该使用实例变量
     2> 惰性加载的方式，创建属性的成本较高所采取的方案；采用了惰性加载，就要采用属性来访问
     3> 在初始化方法中通常是使用实例变量来访问数据
 */

/*
    工厂模式的应用：
   (1)UIButton 创建不同type的按钮的情况下，内部实现细节的隐藏
   (2) 通过类方法创建的实例 
     id someObject = ;
     [someObject class] == [NSArray class];
     [someObject class] 返回的类型是隐藏在类族公共接口后面的某个内部类型(某一个具体的类型，像是某个具体的按钮实例)；
 */

@property(nonatomic,copy)NSString* fristName;
@property(nonatomic,copy)NSString* lastName;

-(instancetype)initWithFristName:(NSString*)firstName lastName:(NSString*)lastName;
@end
