//
//  SortTest.m
//  HZDataStructure
//
//  Created by 华天杰 on 2018/8/14.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "SortTest.h"
#import "Sort.h"

@implementation SortTest
- (void)test{

//    int array[] = {2,4,6,5,8,7,3,1,9,0};
//    selectSort(array,10);
//    for (int i = 0; i<10; i++) {
//        printf("%d\n",array[i]);
//    }
//    
//    
//    
//    Sort* sort = [[Sort alloc] init];
//    /*
//     简单交换排序是效率最低的排序方式；它会破坏已排好的元素顺序
//     复杂度：n^2
//     */
//    NSMutableArray* mutableArray1 = [@[@4,@5,@3,@9,@6,@1] mutableCopy];
//    [sort simpleExchangeSort:mutableArray1];
//    NSLog(@"mutableArray1==>%@",mutableArray1);
//    
//    /*
//     冒泡排序：每一个周期后将最大值或是最小值浮到顶端
//     复杂度：n^2
//     稳定排序
//     */
//    NSMutableArray* mutableArray2 = [@[@4,@5,@3,@9,@6,@1] mutableCopy];
//    [sort bubbleSort:mutableArray2];
//    NSLog(@"mutableArray2==>%@",mutableArray2);
//    
//    /*
//     如何出现 2 1 3 4 5 6 7 这种序列，冒泡排序就没有必要在浮完1之后再进行循环
//     优化的方案是使用标识符做判断
//     */
//    NSMutableArray* mutableArray3 = [@[@2,@1,@3,@4,@5,@6,@7,@8] mutableCopy];
//    [sort optimizeBubbleSort:mutableArray3];
//    NSLog(@"mutableArray3==>%@",mutableArray3);
//    
//    /*
//     简单选择排序是已当前索引（最外层循环i的值）为基准，寻找出当前循环周期内的最值的索引，然后完成交换动作；此种排序方式能有效的减少排序移动的次数。
//     */
//    NSMutableArray* mutableArray4 = [@[@2,@1,@8,@4,@7,@6,@5,@3] mutableCopy];
//    [sort simpleSelectionSort:mutableArray4];
//    NSLog(@"mutableArray4==>%@",mutableArray4);
//    
//    /*
//     直接插入排序：
//     序列基本有序的话这种排序方式就非常高效
//     */
//    NSMutableArray* mutableArray5 = [@[@2,@1,@8,@4,@7,@6,@5,@3] mutableCopy];
//    [sort insertSort:mutableArray5];
//    NSLog(@"mutableArray5==>%@",mutableArray5);
//    
//    /*
//     希尔排序：其实是将相距某个增量的记录分成子序列，然后在子序列中进行直接插入操作得到的结果是基本有序
//     希尔排序的复杂度小于n^2，但跳跃性导致排序为不稳定排序
//     */
//    NSMutableArray* mutableArray6 = [@[@0,@9,@1,@5,@8,@3,@7,@4,@6,@2] mutableCopy];
//    [sort shellSort:mutableArray6];
//    NSLog(@"mutableArray6==>%@",mutableArray6);
 
}
@end
