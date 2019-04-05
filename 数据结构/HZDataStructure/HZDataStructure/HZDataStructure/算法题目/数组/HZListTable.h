//
//  HZListTable.h
//  HZDataStructure
//
//  Created by apple on 16/12/13.
//  Copyright © 2016年 HZ. All rights reserved.
//

#ifndef HZListTable_h
#define HZListTable_h

#include <stdio.h> 

// 线性表：零个或多个数据元素的有限序列；可以理解为数据依次排列除了头结点和尾结点外其他结点只存在唯一的前继和后继；

// 线性表的顺序存储结构
typedef int ElemType;
typedef struct {
    ElemType data[20];
    int length;
}SqList;


/*
 * 在线性表中获取指定位置的元素
 */
int getElem(SqList list,int index,ElemType* e);

/**
 *  在指定位置插入数据
 */
int listInsert(SqList *list,int index,ElemType e);

/**
 *  删除指定位置的元素
 */
int  listDelete(SqList *list,int index,ElemType* e);
#endif /* HZListTable_h */
