//
//  Sort.h
//  SevenSort
//
//  Created by apple on 16/7/12.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Sort : NSObject
/**
 *  简单交换排序
 *
 *  @param sortArray sortArray description
 */
-(void)simpleExchangeSort:(NSMutableArray*)sortArray;

/**
 *  冒泡排序
 *
 *  @param sortArray sortArray description
 */
-(void)bubbleSort:(NSMutableArray*)sortArray;

/**
 *  优化的冒泡排序
 *
 *  @param sortArray sortArray description
 */
-(void)optimizeBubbleSort:(NSMutableArray*)sortArray;

/**
 *  简单选择排序
 *
 *  @param sortArray sortArray description
 */
-(void)simpleSelectionSort:(NSMutableArray*)sortArray;

/**
 *  直接插入排序
 *
 *  @param sortArray sortArray description
 */
-(void)insertSort:(NSMutableArray*)sortArray;

/**
 *  希尔排序
 *
 *  @param sortArray sortArray description
 */
-(void)shellSort:(NSMutableArray*)sortArray;
@end
