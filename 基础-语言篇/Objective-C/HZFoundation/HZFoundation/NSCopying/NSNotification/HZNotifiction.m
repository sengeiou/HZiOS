//
//  HZNotifiction.m
//  HZFoundation
//
//  Created by 华天杰 on 2018/7/8.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZNotifiction.h"

@implementation HZNotifiction

#pragma mark -- 基本使用方法

-(void)addNotifiction{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCallBack) name:@"NotifictionName" object:nil];
}


-(void)postNotification{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotifictionName" object:nil];
}

-(void)notificationCallBack{
    NSLog(@"==== notificationCallBack");
}

/*
 通知
 （1）是一种观察者模式
 （2）是一种一对多的可跨层传递消息的机制
 
 如何实现通知这一机制
 (1) [NSNotificationCenter defaultCenter]创建的是一个单例对象，它维护一个hashMap；
 (2) hashMap中存储的大概为{notiName1:[obj1,obj2,obj3],notiName2:[obj1,obj2,obj3]}的数据结构
 (3) 在[NSNotificationCenter defaultCenter]对象接收到post消息时会根据NotificationName在hashMap中找到
 observerList，并依次调用notification的callback方法
 
 
 */
@end
