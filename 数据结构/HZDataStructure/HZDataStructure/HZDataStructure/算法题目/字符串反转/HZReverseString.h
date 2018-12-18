//
//  HZReverseString.h
//  HZDataStructure
//
//  Created by 华天杰 on 2018/8/14.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZReverseString : NSObject

/*
   使用 begin 、 end指针分别指向字符串的头部和尾部
   交换begin、end指向的数据元素
   执行begin ++；end --
   当begin >= end 结束操作
 */
void char_reverse(char* cha);
@end
