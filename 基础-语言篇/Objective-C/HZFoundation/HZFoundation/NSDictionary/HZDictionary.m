//
//  HZDictionary.m
//  HZFoundation
//
//  Created by dafy on 16/8/15.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZDictionary.h"

@implementation HZDictionary

/*
     1: [dictionary setValue:@"123" forKey:@"key2"];
     当字典中key不存在会引发崩溃
     2: [dictionary setValue:nil forKey:@"key1"];
     即使value的值为nil，也不会引发crash
     3：[dictionary setObject:nil forKey:@"key"];
     设置的值为nil时引发crash
     4： [dictionary objectForKey:@"key4"];
     找不到对应的的key，返回nil
 */


@end
