//
//  DFTwo.m
//  Runtime_总结
//
//  Created by apple on 15/8/28.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "RTDFTwo.h"
#import <objc/runtime.h>
void testMetaClass(id self ,SEL _cmd){
    NSLog(@"This object is %p",self);
    NSLog(@"Class is %@,super class is %@",[self class],[self superclass]);
    Class currentClass = [self class];
    for (int i = 0; i < 4; i++) {
        NSLog(@"Following the isa pointer %d times gives %p",i,currentClass);
        currentClass = objc_getClass((__bridge void*)currentClass);
    }
    NSLog(@"NSObject's class is %p",[NSObject class]);
    NSLog(@"NSObject's meta class is %p",objc_getClass((__bridge void*)[NSObject class]));
}

@implementation RTDFTwo

// 运行时创建一个类，并且为这个类增加一个方法

- (void)ex_registerClassPair{
    
    
    // 注册类
    Class newClass = objc_allocateClassPair([NSError class], "TestClass", 0);
    class_addMethod(newClass, @selector(testMetaClass), (IMP)testMetaClass, "v@");
    objc_registerClassPair(newClass);
    
    id instance = [[newClass alloc] initWithDomain:@"some domin" code:0 userInfo:nil];
    [instance performSelector:@selector(testMetaClass)];
}

@end
