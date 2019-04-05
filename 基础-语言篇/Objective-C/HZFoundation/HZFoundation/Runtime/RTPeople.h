//
//  People.h
//  Runtime_总结
//
//  Created by apple on 15/8/28.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
   类在runtime中的表示
         struct objc_class {
                 Class isa;//指针，顾名思义，表示是一个什么，
                 //实例的isa指向类对象，类对象的isa指向元类
                 #if !__OBJC2__
                     Class super_class;  //指向父类
                     const char *name;  //类名
                     long version;
                     long info;
                     long instance_size
                     struct objc_ivar_list *ivars //成员变量列表
                     struct objc_method_list **methodLists; //方法列表
                     struct objc_cache *cache;//缓存一种优化，调用过的方法存入缓存列表，下次调用先找缓存
                     struct objc_protocol_list *protocols //协议列表
                 #endif
         } OBJC2_UNAVAILABLE;
   Use `Class` instead of `struct objc_class *`
 */



@interface RTPeople : NSObject
{
    NSUInteger _age;
    NSString* _graduateSchool;
}
//@property(nonatomic,assign)NSUInteger age;
//@property(nonatomic,copy)NSString* graduateSchool;

@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* sex;

-(void)test;
//添加关联对象

- (void)addAssociatedObject:(id)object;
//获取关联对象
- (id)getAssociatedObject;

- (void)cook;
- (void)sleep;
// 显示该类方法列表和实例变量列表
- (void)showIvarListAndMethodList;
@end
