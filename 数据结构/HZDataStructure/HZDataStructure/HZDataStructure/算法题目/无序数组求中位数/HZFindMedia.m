//
//  HZFindMedia.m
//  HZDataStructure
//
//  Created by KB on 2018/8/15.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZFindMedia.h"

@implementation HZFindMedia

/*
   无序数组中查找中位数
 
  方法一 ： 将数组排序后，
          数组元素个数为奇数时，中位数为 (n + 1) / 2
          数组元素为偶数时，中位数为（n /2 + (n + 1) /2）/2
 
  方法二 ： 采用快排序的分治思想：[取关键字，高低交替扫描]
 
 */

int findMedia(int a[],int aLen){
    int low = 0;
    int high = aLen - 1 ;
    
    int mid = (aLen - 1) / 2;
    int div = quickSortT(a,low,high);
    while (div != mid) {
        if (mid < div) {
            // 左半区间找
            div = quickSortT(a, low, div - 1);
        }else{
            // 右半区间找
            div = quickSortT(a, div + 1, high);
        }
    }
    if (aLen / 2 == 0) {
        return  (a[mid] + a[mid + 1]) / 2;
    }else{
        return a[mid];
    }
}

int quickSortT(int a[],int left,int right){
    int i = left;
    int j = right;
    int key = a[left];
    
    while (i < j) {
        while (i < j && a[j] >= key) {
            j --;
        }
        if (i < j) {
            a[i]  = a[j];
        }
        while (i < j && a[i] < key) {
            i ++;
        }
        if(i < j){
            a[j] = a[i];
        }
    }
    a[i] = key;
    return  i;
}

@end
