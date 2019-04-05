//
//  NSArray+iOSSafe.m
//  HZFoundation
//
//  Created by apple on 16/12/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "NSArray+iOSSafe.h"
#import <objc/runtime.h>
@implementation NSArray (iOSSafe)

+ (void)load {
    Method originalMethod = class_getClassMethod(self, @selector(arrayWithObjects:count:));
    Method swizzledMethod = class_getClassMethod(self, @selector(hz_arrayWithObjects:count:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

+ (instancetype)hz_arrayWithObjects:(const id [])objects count:(NSUInteger)cnt {
    id nObjects[cnt];
    int i=0, j=0;
    for (; i<cnt && j<cnt; i++) {
        if (objects[i]) {
            nObjects[j] = objects[i];
            j++;
        }
    }
    
    return [self hz_arrayWithObjects:nObjects count:j];
}
@end
