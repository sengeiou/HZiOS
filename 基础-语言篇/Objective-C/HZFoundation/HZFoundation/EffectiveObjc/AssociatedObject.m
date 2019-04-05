//
//  AssociatedObject.m
//  Effective-ObjC
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 HTJ. All rights reserved.
//

/*
   在既有类中使用关联对象存放自定义数据
 // 给分类添加属性
   (1)给对象存储信息，通常会创建对象所属类的子类；但某些情况下无法创建子类，只能通过关联属性值的方式
   (2)关联属性值可能会出现循环引用问题
 
  通过objc_setAssociatedObject给分类创建的属性放在了一个全局的AssociationManager中；
  通过对象的地址找到AssociationManager中的hashMap，然后通过属性的Key来获取属性的value；
 */

#import "AssociatedObject.h"
#import <objc/runtime.h>
@implementation AssociatedObject
static void* associatedObjectKey = "associatedObjectKey";

-(void)askQuestion{
    void (^block)(NSInteger index)= ^(NSInteger index){
        if (0 == index) {
            [self confrim];
        }else if (1 == index){
            [self cancel];
        }
    };
    
    objc_setAssociatedObject(self, associatedObjectKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)associated:(AssociatedObject*)associated index:(NSInteger)index{
    void (^block)(NSInteger index) = objc_getAssociatedObject(associated, associatedObjectKey);
    block(index);
}

-(void)confrim{
  // Class test_class = [NSString class];
}
-(void)cancel{

}
@end
