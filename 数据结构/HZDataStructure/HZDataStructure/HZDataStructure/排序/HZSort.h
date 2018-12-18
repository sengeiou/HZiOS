//
//  HZSort.h
//  SevenSort
//
//  Created by KB on 2018/6/27.
//  Copyright © 2018年 HZ. All rights reserved.
//

#ifndef HZSort_h
#define HZSort_h

#include <stdio.h>

#endif /* HZSort_h */


// 冒泡排序
void bubbleSort(int array[],int n);
// 选择排序
void select1(int array[],int n);
void selectSort(int array[],int n);
// 插入排序
void insertSort(int array[],int n);
void insertSortV(int array[],int n);
// 快速排序
void quickSort1(int array[],int left,int right);
// 希尔排序
void shellsort1(int a[], int n);
// 归并排序
void mergeSort(int array[],int left,int right,int temp[]);
// 堆排序
void heapSort(int array[],int length);


