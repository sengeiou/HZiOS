//
//  Car.m
//  HZFoundation
//
//  Created by KB on 2018/4/9.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "Car.h"
#import <objc/objc-runtime.h>

#pragma mark -- 匿名类别

@interface Car()
@property(nonatomic,copy)NSString* defaultMileage;
@end


@implementation Car

#pragma mark --  @synthesize @dynamic
@synthesize model = myModel;  // 将ivar名称为_model修改为myModel

@dynamic carVersion; //告诉编译器 setter和getter由编程人员自己实现;不实现则会出现调用崩溃；

#pragma mark -- getter和setter方法

-(NSString*)name{
    return _name;
}
-(void)setName:(NSString*)name{
    _name = name;
}

-(void)setModel:(NSString *)model{
    myModel = model; // 等同于
   // _model = model; // 一旦使用@synthesize 自动生成的_model 就无法再使用
}

-(NSString*)color{
    return _color;
}
-(void)setColor:(NSString*)color{
    _color = color;
}


#pragma mark -- 实例方法和类方法

-(void)move{

}

-(void)drive{
    
}

+(instancetype)carWithInformation:(NSDictionary*)infor{
    Car* car = [[Car alloc] init];
    car.name = [infor objectForKey:@"name"];
    car.color = [infor objectForKey:@"color"];
    return car;
}
@end


#pragma mark -- 分类

@implementation Car(HZ)
-(void)automaticDrive{
    NSLog(@"automaticDrive!!!!");
}
@end
