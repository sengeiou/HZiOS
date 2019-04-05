//
//  DFOne.m
//  Runtime_总结
//
//  Created by apple on 15/8/28.
//  Copyright (c) 2015年 DF. All rights reserved.
//

#import "RTDFOne.h"

#import <objc/runtime.h>
@implementation RTDFOne


/*
   两个方法的替换
 */
- (void)exchangeMethod{
    Method methodA = class_getClassMethod([self class], @selector(methodA));
    Method methodB = class_getClassMethod([self class], @selector(methodB));
    
    // 交换两个方法的实现
    method_exchangeImplementations(methodA, methodB);
    
}
- (void)methodA{
    NSLog(@"%@",NSStringFromSelector(@selector(methodA)));
}
- (void)methodB{
    NSLog(@"%@",NSStringFromSelector(@selector(methodB)));
}





- (void)encodeWithCoder:(NSCoder *)coder
{
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char* propertyName =  property_getName(property);
        NSString* key =[NSString stringWithUTF8String:propertyName];
        id value = [self valueForKey:key];
        [coder encodeObject:value forKey:key];
    }
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        unsigned int count;
        objc_property_t *propertyList = class_copyPropertyList([self class], &count);
        for (unsigned int i = 0; i < count; i++) {
            objc_property_t property = propertyList[i];
            const char* propertyName =  property_getName(property);
             NSString* key =[NSString stringWithUTF8String:propertyName];
             [self setValue:[coder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}
@end
