//
//  Sort.m
//  SevenSort
//
//  Created by apple on 16/7/12.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "Sort.h"

@implementation Sort

/*
  简单的交换排序：
  选择当前位置的元素为基准，每次遍历会选出最大或者最小的元素放在当前基准的位置
 */
-(void)simpleExchangeSort:(NSMutableArray*)sortArray{
    for (NSInteger i = 0; i < sortArray.count; i++) {
        for (NSInteger j = i+1; j < sortArray.count; j++) {
            if (sortArray[i] > sortArray[j]) {
                // 交换两个数据
                [sortArray exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
}

// 简单选择排序 【优化了的交换排序】
-(void)simpleSelectionSort:(NSMutableArray*)sortArray{
    for (NSInteger i = 0; i <sortArray.count; i++) {
        NSInteger min = i ;
        for (NSInteger j = i+1; j<sortArray.count; j++) {
            if (sortArray[min]>sortArray[j]) {
                min = j;
            }
        }
        if (min!=i) {
            [sortArray exchangeObjectAtIndex:i withObjectAtIndex:min];
        }
    }
}

#pragma mark -- 冒泡排序

//  冒泡排序（每轮遍历将最大的数或最小的数从数组末尾像气泡一样升到数组的上部）
-(void)bubbleSort:(NSMutableArray*)sortArray{
    for (NSInteger i = 0; i < sortArray.count; i++) {
        for (NSInteger j =  sortArray.count - 1; j-i > 0; j--) {
            if (sortArray[j-1]>sortArray[j]) {
                // 交换两个数据
                [sortArray exchangeObjectAtIndex:j-1 withObjectAtIndex:j];
            }
        }
   }
}

// 优化的冒泡排序
-(void)optimizeBubbleSort:(NSMutableArray*)sortArray{
    BOOL flag = YES;
    for (NSInteger i = 0; i < sortArray.count && flag; i++) {
        for (NSInteger j =  sortArray.count - 1; j-i > 0; j--) {
            flag = NO;
            if (sortArray[j-1]>sortArray[j]) {
                // 交换两个数据
                [sortArray exchangeObjectAtIndex:j-1 withObjectAtIndex:j];
                 flag = YES;
            }
        }
    }
}

#pragma mark -- 插入排序

// 直接插入排序
-(void)insertSort:(NSMutableArray*)sortArray{
    for (NSInteger i = 0; i < sortArray.count-1; i++) {
        if (sortArray[i+1] < sortArray[i]) {
            NSNumber *tempNum = sortArray[i+1];
            for (NSInteger j= i+1; j>0&&sortArray[j-1]>tempNum; j--) {
                [sortArray exchangeObjectAtIndex:j-1 withObjectAtIndex:j];
            }
        }
    }
}

/*
   9,8,3,2,1,6,10
 */
void insert_sort(int array[],unsigned int n){
    int i,j;
    int temp;
    for(i = 1;i < n;i++){
        temp = array[i];
        for(j = i;j > 0&& array[j - 1] > temp;j--){
            array[j]= array[j - 1];
        }
        array[j] = temp;// 将元素插到指定位置
    }
}



// 希尔排序
-(void)shellSort:(NSMutableArray*)sortArray{
    NSInteger increment = sortArray.count;
    NSInteger i ,j ;
    do {
        increment = increment/3+1;//增量的值
        for ( i = increment+1; i<sortArray.count; i++) {
            if (sortArray[i]<sortArray[i-increment]) {
                sortArray[0] = sortArray[i];
                //检查子序列是否可以插入排序
                for ( j = i-increment; j>0&&sortArray[0]<sortArray[j] ; j-=increment) {
                    sortArray[j+increment] = sortArray[j];
                }
                sortArray[j+increment] = sortArray[0];
            }
        }
    } while (increment>1);
}

// 快速排序

void quickSort(int array[],int left,int right){
    if (left<right) {
        int i = left;
        int j = right;
        int x = array[i];
        
        while (i<j) {
            //  从右像左查找小于x的元素填充array[i];
            while (i<j && array[j]>=x) {
                j--;
            }
            if(i<j){
                array[i] = array[j];
                i++;
            }
            
            // 从左向右找大于或等于x的数来填充array[j];
            while (i<j&&array[i]<x) {
                i++;
            }
            if (i<j) {
                array[j] = array[i];
                j--;
            }
        }
        // 退出时 i=j
        array[i] = x;
        quickSort(array, left, i-1);
        quickSort(array, i+1, right);
    }
}


@end
