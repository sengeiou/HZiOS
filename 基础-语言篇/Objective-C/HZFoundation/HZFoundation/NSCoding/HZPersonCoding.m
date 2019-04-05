//
//  HZPersonCoding.m
//  HZFoundation
//
//  Created by apple on 16/12/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZPersonCoding.h"
#import <objc/runtime.h>


@implementation HZPersonCoding


- (id)initWithCoder:(NSCoder *)coder{
    NSLog(@"%s",__func__);
    Class cls = [self class];
    while (cls != [NSObject class]) {
    /*判断是自身类还是父类*/
    BOOL bIsSelfClass = (cls == [self class]);
    unsigned int iVarCount = 0;
    unsigned int propVarCount = 0;
    unsigned int sharedVarCount = 0;
    Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
    objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/
    sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;

    for (int i = 0; i < sharedVarCount; i++) {
    const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
    NSString *key = [NSString stringWithUTF8String:varName];
    id varValue = [coder decodeObjectForKey:key];
    NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"];
    if (varValue && [filters containsObject:key] == NO) {
    [self setValue:varValue forKey:key];
    }
    }
    free(ivarList);
    free(propList);
    cls = class_getSuperclass(cls);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
        NSLog(@"%s",__func__);
        Class cls = [self class];
        while (cls != [NSObject class]) {
        /*判断是自身类还是父类*/
        BOOL bIsSelfClass = (cls == [self class]);
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int sharedVarCount = 0;
        Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/
        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;

        for (int i = 0; i < sharedVarCount; i++) {
        const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
        NSString *key = [NSString stringWithUTF8String:varName];
        /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/
        id varValue = [self valueForKey:key];
        NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"];
        if (varValue && [filters containsObject:key] == NO) {
        [coder encodeObject:varValue forKey:key];
        }
        }
        free(ivarList);
        free(propList);
        cls = class_getSuperclass(cls);
  }
}

@end
