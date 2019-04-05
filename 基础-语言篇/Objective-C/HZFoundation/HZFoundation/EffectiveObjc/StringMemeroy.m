//
//  StringMemeroy.m
//  Effective-ObjC
//
//  Created by apple on 16/2/15.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "StringMemeroy.h"

@implementation StringMemeroy
-(void)test{
    //创建一个字符串对象   Format创建的字符串
    //肯定在堆区  NSMutableString 肯定在堆区
    NSString * string = [[NSString alloc] initWithFormat:@"Hello World!!"];
    //创建一个强引用类型的变量 默认情况下就是强引用
    //如果string对象的值要时发生了变换，那么强引用变量
    //依然持有原对象的数据。
    __strong NSString *my = string;
    NSLog(@"my = %@",my);
    //改变string 这个对象的值
    string = [[NSString alloc] initWithFormat:@"hua"];
    //仍然保存的是修改前的数据
    NSLog(@"my = %@",my);//Hello World!!
    //总结：强引用对象，会持有对象中原来的数据
    
    
    
    
    //------------------------弱引用类型weak-----------------------
    NSString * weakString = [[NSString alloc] initWithFormat:@"Hello hua"];
    //弱引用类型的变量
    __weak NSString * str = weakString;
    NSLog(@"str = %@ ",str);
    NSLog(@"str = %p ; weakString= %p",str,weakString);
    //当弱引用类型的指针指向的对象如果发生了变化 str 就会置成
    //空
    weakString = string;//指向的对象发生了变化（内存地址）
    //发生改变以后是空值
    NSLog(@"str = %@ ",str);
    
}

@end
