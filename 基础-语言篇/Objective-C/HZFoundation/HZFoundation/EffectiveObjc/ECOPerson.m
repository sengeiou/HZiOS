//
//  ECOPerson.m
//  Effective-ObjC
//
//  Created by apple on 16/2/15.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "ECOPerson.h"

@implementation ECOPerson{
    NSMutableSet* _friends;
}

-(instancetype)initWithFristName:(NSString *)fristName
                     andLastName:(NSString *)lastName{
    self = [super init];
    if (self) {
        _firstName = fristName;
        _lastName  = lastName;
        _friends   = [NSMutableSet new];
    }
    return  self;
}

-(void)addFriends:(ECOPerson *)person{
    [_friends addObject:person];
}
-(void)removeFriends:(ECOPerson *)person{
    [_friends removeObject:person];
}

// 遵守NSCopying协议实现该方法
-(id)copyWithZone:(NSZone *)zone{
    ECOPerson* copyPerson = [[[self class] allocWithZone:zone] initWithFristName:_firstName andLastName:_lastName];
    // 在此做拷贝是避免两个对象共用set集合
    // 若是set是不可变的此处就不需要拷贝
    copyPerson -> _friends = [_friends mutableCopy]; //浅拷贝
   // copyPerson -> _friends = [[NSMutableSet alloc] initWithSet:_friends copyItems:YES];//深拷贝，把每一个Item都拷贝
    return copyPerson;
}

/*
   (1)
   有些情况下不需要采用全能初始化方法来初始化待拷贝对象：
   例如对象中有一个复杂的数据结构，拷贝之后会重新赋值这样就不需要了
   (2)
    深拷贝：拷贝对象自身的同时把底层数据一并拷贝
    浅拷贝：只拷贝对象本身不拷贝数据(Foundation中的集合都是浅拷贝->容器中的对象未必都能拷贝，)
 */

/*
  (1) 若想令自己所写的对象具有拷贝功能，则需要实现NSCopying协议
  (2) 一般的复制对象都是浅拷贝
 */
@end
