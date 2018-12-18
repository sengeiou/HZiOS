//
//  HZBubbleSort.h
//  HZDataStructure
//
//  Created by 华天杰 on 2017/6/12.
//  Copyright © 2017年 HZ. All rights reserved.
/**
 *  冒泡排序
 */

#import <Foundation/Foundation.h>

@interface HZBubbleSort : NSObject

/**
 此排序方法并不是真正意义上的冒泡排序
 没有做到仅对相邻两个元素之间的比较
 属于不稳定的排序
 @param array 待排序数组
 @return 已完成排序的数组
 */
+(NSArray*)hz_BubbleSortWithArray:(NSMutableArray*)array;


/**
  冒泡排序

 @param array 待排序数组
 @return 已完成排序的数组
 */
+(NSArray*)hz_BubbleRealSortWithArray:(NSMutableArray*)array;


/**
 优化的冒泡排序
 避免不必要的轮循比较
 @param array 待排序数组
 @return 已完成排序的数组
 */
+(NSArray*)hz_BubbleOptimizeRealSortWithArray:(NSMutableArray*)array;
@end
