//
//  NSDictionary+iOSSafe.m
//  HZFoundation
//
//  Created by apple on 16/12/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "NSDictionary+iOSSafe.h"
#import <objc/runtime.h>
@implementation NSDictionary (iOSSafe)

+ (void)load {
    Method originalMethod = class_getClassMethod(self, @selector(dictionaryWithObjects:forKeys:count:));
    Method swizzledMethod = class_getClassMethod(self, @selector(hz_dictionaryWithObjects:forKeys:count:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

+ (instancetype)hz_dictionaryWithObjects:(const id [])objects forKeys:(const id <NSCopying> [])keys count:(NSUInteger)cnt {
    id nObjects[cnt];
    id nKeys[cnt];
    int i=0, j=0;
    for (; i<cnt && j<cnt; i++) {
        if (objects[i] && keys[i]) {
            nObjects[j] = objects[i];
            nKeys[j] = keys[i];
            j++;
        }
    }
    return [self hz_dictionaryWithObjects:nObjects forKeys:nKeys count:j];
}
@end
