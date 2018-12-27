//
//  HZMethodSetAndGet.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/26.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZMethodSetAndGet.h"
#import <objc/runtime.h>

@interface HZMethodSetAndGet()

@property(nonatomic,strong)NSMutableDictionary* propertyMap;

@end

@implementation HZMethodSetAndGet
@dynamic name;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _propertyMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSString *selName = NSStringFromSelector(aSelector);
    if ([selName hasPrefix:@"set"]) {
        // v@:@ : v 代表返回值 @ 代表第一个参数 self ：代表 _cmd(SEL) @：params
        return  [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }else{
        // v@:@ :
        return [NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSString *funcName = NSStringFromSelector(anInvocation.selector);
    if ([funcName hasPrefix:@"set"]) {
        // setXXX:
        NSString *propertyName = [[funcName substringWithRange:NSMakeRange(3, funcName.length-4)] lowercaseString];
        NSString *obj;
        // 0 self 1 _cmd 2代表参数 ==》 从参数列表中找到具体的值
        [anInvocation getArgument:&obj atIndex:2];
        [_propertyMap setObject:obj forKey:propertyName];
    }else{
        NSString *obj = [_propertyMap objectForKey:funcName];
        [anInvocation setReturnValue:&obj];
    }
}

@end
