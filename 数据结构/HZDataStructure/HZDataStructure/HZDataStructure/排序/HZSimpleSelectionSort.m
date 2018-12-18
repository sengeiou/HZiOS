//
//  HZSimpleSelectionSort.m
//  HZDataStructure
//
//  Created by 华天杰 on 2017/6/13.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZSimpleSelectionSort.h"

@implementation HZSimpleSelectionSort
+(NSArray*)hz_simpleSelectionSortWithArray:(NSMutableArray*)array{
    NSInteger min;//最小值的下标
    for (NSInteger i=0; i<array.count; i++) {
        min = i;
        for (NSInteger j=i; j<array.count; j++) {
            NSInteger fontInteger = [array[min] integerValue];
            NSInteger behindInteger = [array[j] integerValue];
            if (fontInteger>behindInteger) {
                min = j;
            }
        }
        if (min!=i) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:min];
        }
    }
    return [array copy];
}
@end
