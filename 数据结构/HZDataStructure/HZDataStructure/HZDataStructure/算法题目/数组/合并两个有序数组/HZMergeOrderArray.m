//
//  HZMergeOrderArray.m
//  HZDataStructure
//
//  Created by KB on 2018/8/15.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZMergeOrderArray.h"

@implementation HZMergeOrderArray
/*
   合并两个有序数组为一个；

 */
void merge_array(int a[],int lenA,int b[],int lenB,int result[]){
    int p = 0;
    int q = 0;
    int i = 0;
    
    while (p < lenA && q < lenB) {
        if (a[p] <= b[q]) {
            result[i] = a[p];
            p++;
        }else{
            result[i] = b[q];
        }
        i++;
    }
    
    while (p < lenA) {
        result[i] = a[p];
        i++;
    }
    while (q < lenB) {
        result[i] = b[q];
        i++;
    }
}
@end
