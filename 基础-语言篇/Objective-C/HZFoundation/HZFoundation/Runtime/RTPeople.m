//
//  People.m
//  Runtime_总结
//
//  Created by apple on 15/8/28.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "RTPeople.h"
#import <objc/runtime.h>
void runAddMethod(id self,SEL _cmd, NSString* string){
    NSLog(@"add C IMP %@",string);
}

@implementation RTPeople

// 动态增加实例方法
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if ([NSStringFromSelector(sel) isEqualToString:@"addMethod:"]) {
        class_addMethod(self, sel, (IMP)runAddMethod, "v");
    }
    return YES;
}

-(void)test{
    unsigned int count;
    Method * methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i< count; i++) {
        Method method =  methodList[i];
        NSLog(@"method---->%@",NSStringFromSelector(method_getName(method)));
    }
}

-(void)setAge:(NSUInteger)age{
    _age = age;
}
-(NSUInteger)age{
    return _age;
}

//添加关联对象
- (void)addAssociatedObject:(id)object{
    objc_setAssociatedObject(self, @selector(getAssociatedObject), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/*
  关联对象的值存储在哪里？
  存储在一个全局的hashMap中
                       {
                          self:{key:ssociatedObject}，
                          object:{}，
                        }
*/

//获取关联对象
- (id)getAssociatedObject{
    return objc_getAssociatedObject(self, _cmd);
}



- (void)cook{

}
- (void)sleep{

}

- (void)showIvarListAndMethodList{
    unsigned int count;
    
    // 获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"propery---->%@",[NSString stringWithUTF8String:propertyName]);
    }
    
    // 获取方法列表
    Method * methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i< count; i++) {
        Method method =  methodList[i];
        NSLog(@"method---->%@",NSStringFromSelector(method_getName(method)));
    }
    
    // 获取成员变量
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i< count; i++) {
        Ivar ivar = ivarList[i];
        const char * ivarName =ivar_getName(ivar);
        NSLog(@"ivarName---->%@",[NSString stringWithUTF8String:ivarName]);
    }
    
   
}
@end
