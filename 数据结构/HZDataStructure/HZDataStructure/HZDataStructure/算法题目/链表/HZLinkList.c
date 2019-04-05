//
//  HZLinkList.c
//  HZDataStructure
//
//  Created by apple on 16/12/14.
//  Copyright © 2016年 HZ. All rights reserved.
//

#include "HZLinkList.h"
#include <stdlib.h>

// 单链表的初始化
LinkList linkListInit(){
    Node* L ;
    L = (Node*)malloc(sizeof(Node));
    if (L == NULL) {
        printf("申请内存空间失败\n");
    }
    L ->next = NULL;
    return L;
}

// 单链表的建立，头插法
LinkList linkListCreateHeaderMethod(int numberOfNode){
    Node* L ;
    L = (Node*)malloc(sizeof(Node));
    if (L==NULL) {
        return NULL;
    }
    L->next = NULL;
    for (int i =0; i<numberOfNode; i++) {
        Node *p;
        p =(Node*) malloc(sizeof(Node));
        p -> data = i ;
        p->next = L->next;   //将结点插入到表头L-->|3|-->|2|-->|1|-->NULL
        L -> next = p;
    }
    return L;
}

// 单链表的尾部插入法
LinkList linkListCreateTailMethod(int numberOfNode){
    Node* L ;
    L = (Node*)malloc(sizeof(Node));
    if (L==NULL) {
        return NULL;
    }
    L -> next = NULL;
    Node* tempL = L;
    for (int i = 0; i<numberOfNode; i++) {
        Node* p ;
        p = (Node*)malloc(sizeof(Node));
        p ->data = i ;
        tempL -> next = p ;
        tempL = p ;
    }
    tempL ->next = NULL;
    return L;
}

/**
 *  在链表的指定位置插入元素
 *  遍历找到指定位置的前一个结点，通过指针的交换
 */
int linkListInsert(LinkList list ,int index,int e){
    Node* pre ;
    pre = list;
    for (int i = 1; i<index; i++) {
        pre = pre ->next;
    }
    if (pre) {
        Node* newNode;
        newNode  = (Node*)malloc(sizeof(Node));
        newNode->data = e ;
        newNode->next = pre->next;
        pre->next = newNode;
        return 1;
    }
    return 0;
}

/**
 *   删除指定数据值的结点
 *
 */
int linkListDeleteNode(LinkList list ,int e){
    Node *p,*pre = NULL;                   //pre为前驱结点，p为查找的结点。
    p = list->next;
    while(p->data != e)              //查找值为x的元素
    {
        pre = p;
        p = p->next;
    }
    pre->next = p->next;          //删除操作，将其前驱next指向其后继。
    free(p);
    return 1;
}

/**
 * 获取指定位置的结点，并返回数据元素
 * 
 */
int GetElem(LinkList list,int index,ElemType *e){
    int i=1;
    LinkList p ;
    p = list ->next; // 默认链表名作为第一个结点的指针
    while (i<index&&p) {
        p = p ->next;
        i++;
    }
    if (!p||i>index) {
       return 0;
    }else{
        *e = p->data;
        return 1;
    }
}
