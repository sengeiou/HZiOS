//
//  HZSort.m
//  HZFoundation
//
//  Created by apple on 16/11/24.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZSort.h"

@implementation HZSort

/**
 *   选择排序方案
 *  从大到小排序
 *  
 *  选择排序最好是0次交换，最差n-1次交换；
 *  选择排序需要进行n(n-1)/2比较
 *  时间复杂度：n^2
 *  稳定性：
 */
-(NSMutableArray*)selectSort{
    NSMutableArray* sortArray = [@[@"8",@"9",@"10",@"11",@"3",@"4",@"5",@"6",@"7"] mutableCopy];
    for (NSInteger i=0; i<sortArray.count; i++) {
        for (NSInteger j = i+1; j<sortArray.count; j++) {
            if ([sortArray[i] integerValue]<[sortArray[j] integerValue]) {
                [sortArray exchangeObjectAtIndex:j withObjectAtIndex:i];
            }
        }
    }
    return sortArray;
}

/**
 *  插入排序
 *
 *
 *
 */
-(NSMutableArray*)insertionSort{
    NSMutableArray* sortArray = [@[@"8",@"9",@"10",@"11",@"3",@"4",@"5",@"6",@"7"] mutableCopy];
    for(NSInteger i = 0;i< sortArray.count-1 ;i++){
        for (NSInteger j = i+1; j>0; j--) {
            if ([sortArray[j] integerValue] > [sortArray[j-1] integerValue]) {
                [sortArray exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            }
        }
    }
    return sortArray;
}
@end
