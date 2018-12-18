//
//  HZSimpleSelectionSort.h
//  HZDataStructure
//
//  Created by 华天杰 on 2017/6/13.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSimpleSelectionSort : NSObject

/**
 简单选择排序
 从n-i+1个记录中选出最小的元素与第i个元素做对比；
 
  数列：{a1，a2，a3，a4，…，an}
 
 
 
 
 @param array 待排序数组
 @return 已完成排序数组
 */
+(NSArray*)hz_simpleSelectionSortWithArray:(NSMutableArray*)array;
@end
