//
//  HZProperty+HZ.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/24.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZProperty+HZ.h"
#import <objc/runtime.h>

const void *key = "hobit";
@implementation HZProperty (HZ)
-(void)method{
    objc_setAssociatedObject(self, &key, @"123", OBJC_ASSOCIATION_COPY);
    NSString * hobit = objc_getAssociatedObject(self, &key);
    NSLog(@"==>%@",hobit);
}
    
@end
