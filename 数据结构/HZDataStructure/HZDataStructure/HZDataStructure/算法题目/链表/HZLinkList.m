//
//  HZLinkList.m
//  HZDataStructure
//
//  Created by 华天杰 on 2019/3/11.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import "HZLinkList.h"

typedef struct  LinkNode{
    int data;
    struct LinkNode *next;
}snode,*ptr;

@implementation HZLinkList

-(ptr)createHeadLinkList{
    ptr head,p;
    int x;
    head = NULL;
    scanf("%d",&x);
    while (x!=0) {
        p = (ptr)malloc(sizeof(snode));
        p -> data = x;
        p ->next = head;
        head = p;
        scanf("%d",&x);
    }
    return head;
}

-(ptr)createTailLinkList{
    ptr head, p ,last;
    head = last = (ptr)malloc(sizeof(snode));// 开辟一个临时结点
    int x;
    scanf("%d",&x);
    while (x!=0) {
        p = (ptr)malloc(sizeof(snode));
        p -> data = x;
        last ->next = p;
        last = p;
       scanf("%d",&x);
    }
    last = head; // 将last指针指向临时结点
    head = head ->next; //将head指针指向当前链表的第一个结点
    free(last); // 释放临时结点
    return head;
}
@end
