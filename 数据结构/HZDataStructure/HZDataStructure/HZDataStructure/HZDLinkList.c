//
//  HZDLinkList.c
//  HZDataStructure
//
//  Created by KB on 2018/6/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#include "HZDLinkList.h"
#include <stdlib.h>

DLinkList DLinkListCreateT(){
    Node *L,*p,*r;
    L = (Node *)malloc(sizeof(Node));// 申请头结点
    L->next = NULL;
    r = L;
    r->next = NULL;//r为指向终端节点的指针
    ElemType x;
    while (scanf("%d",&x)!=EOF) {
        p = (Node *)malloc(sizeof(Node));
        p->data = x;
        p->prior = r;
        r->next = p;
        p->next = NULL;
        r = p;
    }
    return L;
}

