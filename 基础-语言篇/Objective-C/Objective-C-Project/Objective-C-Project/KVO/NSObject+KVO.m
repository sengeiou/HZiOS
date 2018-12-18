//
//  NSObject+KVO.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/12.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>

@implementation NSObject (KVO)
- (void)hz_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    //动态添加一个类
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [@"NSKVONotyfing_" stringByAppendingString:oldClassName];
    const char * newName = [newClassName UTF8String];
    Class newClass = objc_allocateClassPair([self class], newName, 0);
    // 
}
@end
