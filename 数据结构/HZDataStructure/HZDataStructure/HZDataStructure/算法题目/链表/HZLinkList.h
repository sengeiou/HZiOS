//
//  HZLinkList.h
//  HZDataStructure
//
//  Created by apple on 16/12/14.
//  Copyright © 2016年 HZ. All rights reserved.
//

#ifndef HZLinkList_h
#define HZLinkList_h

#include <stdio.h>
/*
 (1)线性表的顺序存储结构优点和缺点
    查找时操作较快但是插入和删除操作通常需要移动大量的元素位置
 （2）线性表的链式存储结构
   在顺序存储结构中数据元素只要存储数据元素信息就可以了，而链式存储结构还需要存储下一个结点的内存地址，即每个数据元素成为一个独立的结点，结点包含数据信息和地址信息两个部分；
     n个这样的结点就构成了链表，
 （3）单链表 
      因为结点中只存在一个指针，即该链表又称之为单链表
 （4）头结点
    排在单链表的第一个结点前的结点叫头结点
 （5）头指针
     链表第一个结点存放的指针即为头指针
 */

// 线性表的链式存储结构
typedef int ElemType;
typedef struct Node{
    ElemType data;
    struct Node *next;
}Node;
typedef struct Node *LinkList;

// 单链表的初始化
LinkList linkListInit();

// 单链表的尾部插入法
LinkList linkListCreateTailMethod(int numberOfNode);

// 单链表的建立，头插法
LinkList linkListCreateHeaderMethod(int numberOfNode);

//删除指定数据值的结点
int linkListDeleteNode(LinkList list ,int e);

//获取指定位置的结点，并返回数据元素
int GetElem(LinkList list,int index,ElemType *e);

#endif /* HZLinkList_h */
