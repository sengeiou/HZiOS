//
//  RunTime_拾遗.h
//  Runtime_总结
//
//  Created by apple on 15/8/31.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunTime___ : NSObject
/*
    (1)super
        如果我们需要在类的方法中调用父类的方法时，通常都会用到super
 
        self是类的一个隐藏参数，每个方法的实现的第一个参数即为self。而super并不是隐藏参数，它实际上只是一个”编译器标示符”，它负责告诉编译器，当调用viewDidLoad方法时，去调用父类的方法，而不是本类中的方法。而它实际上与self指向的是相同的消息接收者。
 
 
        struct objc_super { id receiver; Class superClass; };
        // 接收消息会调用这个函数
       id objc_msgSendSuper ( struct objc_super *super, SEL op, ... );
 */
@end
