//
//  HZListTable.c
//  HZDataStructure
//
//  Created by apple on 16/12/13.
//  Copyright © 2016年 HZ. All rights reserved.
//

#include "HZListTable.h"
/*
   在线性表中获取指定位置的元素
 */
int getElem(SqList list,int index,ElemType* e){
    if (list.length==0 || index<1 ||index>list.length) {
        return 0;
    }else{
        *e = list.data[index-1];
        return 1;
    }
}

/**
 *  在指定位置插入数据
 *  插入操作即将指定位置后面所有的元素向后移动一位，要避免超出存储的最大长度
 */
int listInsert(SqList *list,int index,ElemType e){
    if (index>list->length+1||index<1) {
        return 0;
    }else{
        if (index == list->length+1) {
            list->data[index-1] = e;
            return 1;
        }else{
            int lastIndex = list->length;
            for (int i = lastIndex; i>=index; i--) {
                list->data[i] = list->data[i-1];
            }
            list->data[index-1] = e ;
            list->length++; //元素插入完毕后增加list的长度
            return 1;
        }
    }
}

/**
 *  删除指定位置的元素
 *  将指定位置后面所有的元素依次向前平移一位
 */
int  listDelete(SqList *list,int index,ElemType* e){
    if (list->length==0||index<1||index>list->length) {
        return 0;
    }
    *e = list->data[index-1];
    for (int i = index; i<list->length; i++) {
        list->data[i-1] = list->data[i];
    }
    list->length--;
    return 1;
}
