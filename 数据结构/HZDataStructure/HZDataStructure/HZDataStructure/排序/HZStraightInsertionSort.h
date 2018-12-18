//
//  HZStraightInsertionSort.h
//  HZDataStructure
//
//  Created by 华天杰 on 2017/6/14.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZStraightInsertionSort : NSObject


/**
 简单插入排序
 
 将n个元素的数列分为已有序和无序两个部分。
 
 数列：{a1，a2，a3，a4，…，an}
 
 将该数列的第一元素视为有序数列，后面都视为无序数列：
 
 {{a1}，{a2，a3，a4，…，an}}
 
 将无序数列中的元素插入到有序数列的对应位置，插入前通过比大小的方式找到其在有序数列中的对应位置
 
 @param array 待排序数组
 @return 已排序数组
 */
+(NSArray*)hz_straightInsertionSortWithMutableArray:(NSMutableArray*)array;
@end
