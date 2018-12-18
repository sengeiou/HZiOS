//
//  HZDLinkList.h
//  HZDataStructure
//
//  Created by KB on 2018/6/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#ifndef HZDLinkList_h
#define HZDLinkList_h

#include <stdio.h>

typedef int ElemType;

// 定义双链表节点
typedef struct Node{
    ElemType data;
    struct Node *prior;
    struct Node *next;
}Node ,*DLinkList;

#endif /* HZDLinkList_h */
