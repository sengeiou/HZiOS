//
//  HZReverseLinkList.h
//  HZDataStructure
//
//  Created by 华天杰 on 2018/8/14.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

struct Node {
    int data;
    struct Node* next;
};

@interface HZReverseLinkList : NSObject

/*
   单链表反转：
   采用头插法创建新的链表
   遍历当前链表将当前指向的节点按照头插法的步骤插入到新链表中
 */

struct Node* reverseList(struct Node *head);

@end
