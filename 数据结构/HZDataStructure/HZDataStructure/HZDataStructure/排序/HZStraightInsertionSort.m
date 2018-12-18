//
//  HZStraightInsertionSort.m
//  HZDataStructure
//
//  Created by 华天杰 on 2017/6/14.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZStraightInsertionSort.h"

@implementation HZStraightInsertionSort

+(NSArray*)hz_straightInsertionSortWithMutableArray:(NSMutableArray*)array{
    for (NSInteger i =1;i<array.count; i++) {
        NSInteger currentInteger = [array[i] integerValue];
        NSInteger beforeInteger = [array[i-1] integerValue];
        // 升序排列
        if (currentInteger<beforeInteger) {
            NSInteger guard = currentInteger; //记录待插入元素的值
            NSInteger j = i-1;// 记录已排序列表的最后一个元素的位置
            array[j+1] = array[j];// 扩大已排序列表的容量
            
            while (j>=0&&[array[j] integerValue]>guard) {
                array[j+1] = array[j];//
                j--;
            }
            //在查找到的元素后面插入
            array[j+1]= @(guard);
        }
    }
    
    return [array copy];
}
@end
