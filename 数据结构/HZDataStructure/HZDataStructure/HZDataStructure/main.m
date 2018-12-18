//
//  main.m
//  HZDataStructure
//
//  Created by apple on 16/12/13.
//  Copyright © 2016年 HZ. All rights reserved.
/*
  // 数据结构
   http://www.cnblogs.com/newwy/category/264674.html
 //
 */

#import <Foundation/Foundation.h>
#import "HZListTable.h"
#import "HZLinkList.h"

#import "HZBubbleSort.h"
#import "HZSimpleSelectionSort.h"
#import "HZStraightInsertionSort.h"

#import "HZString.h"

#import "HZFindMedia.h"

#include "HZSort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 2,3,4,4,6,8,9,10
//        int a[] = {3,6,9,2,4,8,10,4};
//       int index = findMedia(a, 10);
//        NSLog(@"%d",index);
        
//        HZString* str = [HZString new];
//        [str selectedString];
 
//        NSMutableArray* waitSortArray = [@[@9,@8,@3,@6,@7,@2,@5,@1,@4]mutableCopy];
//
//        for (NSInteger i=0; i<waitSortArray.count; i++) {
//            for (NSInteger j = i+1; j<waitSortArray.count-i; j++) {
//                if ([waitSortArray[j] integerValue]>[waitSortArray[j-1] integerValue]) {
//                    [waitSortArray exchangeObjectAtIndex:j withObjectAtIndex:j-1];
//                }
//            }
//        }
//        NSLog(@"==>:%@",waitSortArray);
        
#pragma mark- 线性表的顺序存储
     
//        SqList list;
//        list.length = 3;
//        for (int i = 0; i < list.length; i++) {
//            list.data[i] = i;
//        }
//        
//        int tempElem;
//       int statusCode =  getElem(list,3,&tempElem);
//       printf("statusCode:%d---tempElem:%d\n",statusCode,tempElem);
//
//       int statusCodeInsert =   listInsert(&list, 2, 5);
//        for (int i = 0; i<list.length; i++) {
//            printf("%d\n",list.data[i]);
//        }
//       printf("statusCodeInsert:%d\n",statusCodeInsert);
//        
//        int tempElemDelete;
//        int statusCodeDelete =   listDelete(&list, 3, &tempElemDelete);
//        for (int i = 0; i<list.length; i++) {
//            printf("%d\n",list.data[i]);
//        }
//         printf("statusCodeDelete--->:%d\n",statusCodeDelete);
//
#pragma mark- 线性表的链式存储
        /*
        LinkList linkListHead = linkListCreateHeaderMethod(10);
        printf("----->:%d\n",linkListHead->next->data);
        
        LinkList linkList = linkListCreateTailMethod(10);
        printf("----->:%d\n",linkList->next ->next->data);
         */
        
        
#pragma mark -- 冒泡排序
        
        int array[] = {7,1,6,3,2,9,4,8,5,0};
        int temp[10] = {0};
        mergeSort(array, 0, 9, temp);
        for (int i =0; i< 10; i++) {
            printf("%d\n",array[i]);
        }
        
    }
    
    return 0;
}
