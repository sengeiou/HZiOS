//
//  HZBubbleSort.m
//  HZDataStructure
//
//  Created by 华天杰 on 2017/6/12.
//  Copyright © 2017年 HZ. All rights reserved.
/**
 * 将数组元素按照从小到大的顺序排列
 * 时间复杂度：n^2
 */

#import "HZBubbleSort.h"

@implementation HZBubbleSort

+(NSArray*)hz_BubbleSortWithArray:(NSMutableArray*)array{
    NSArray* sortFinishArray;
    for (NSInteger i = 0; i<array.count; i++) {
        for (NSInteger j=i+1; j<array.count; j++) {
            NSInteger firstInteger = [array[j] integerValue];
            NSInteger secondInteger = [array[i] integerValue];
            if (firstInteger<secondInteger) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:i];
            }
        }
    }
    sortFinishArray = [array copy];
    return sortFinishArray;
}


+(NSArray*)hz_BubbleRealSortWithArray:(NSMutableArray*)array{
    NSArray* sortFinishArray;
    for (NSInteger i = 0; i<array.count; i++) {
        for (NSInteger j=array.count-1; j>i; j--) {
            NSInteger firstInteger = [array[j] integerValue];
            NSInteger secondInteger = [array[j-1] integerValue];
            if (firstInteger<secondInteger) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            }
        }
    }
    sortFinishArray = [array copy];
    return sortFinishArray;
}

+(NSArray*)hz_BubbleOptimizeRealSortWithArray:(NSMutableArray*)array{
    NSArray* sortFinishArray;
    bool isGoOn=true;
    for (NSInteger i = 0; i<array.count&&isGoOn; i++) {
        isGoOn = false;
        for (NSInteger j=array.count-1; j>i; j--) {
            NSInteger firstInteger = [array[j] integerValue];
            NSInteger secondInteger = [array[j-1] integerValue];
            if (firstInteger<secondInteger) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j-1];
                isGoOn = true;
            }
        }
    }
    sortFinishArray = [array copy];
    return sortFinishArray;
}

@end
