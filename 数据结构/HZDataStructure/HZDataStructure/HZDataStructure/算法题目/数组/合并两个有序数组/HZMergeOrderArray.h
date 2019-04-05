//
//  HZMergeOrderArray.h
//  HZDataStructure
//
//  Created by KB on 2018/8/15.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZMergeOrderArray : NSObject
/*
   将两个有序数组合并到一个数组中，并且保持有序
 */

void merge_array(int a[],int lenA,int b[],int lenB,int result[]);
@end
