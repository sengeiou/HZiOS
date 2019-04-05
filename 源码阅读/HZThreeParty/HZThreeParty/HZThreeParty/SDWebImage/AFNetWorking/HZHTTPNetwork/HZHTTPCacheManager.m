//
//  HZHTTPCacheManager.m
//  HZThreeParty
//
//  Created by KB on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZHTTPCacheManager.h"

@implementation HZHTTPCacheManager

/*
   (1) MD5(baseURL + APICode + versionCode + 基础业务参数) ==> FILEName
    (2) 判断 cacheDir+FILEName 路径是否存在
 （3）若是路径存在则反序列化cache的对象，判断对象是否过期
 （4）若是对象数据可用则返回，不可用则清除数据
 
  注意事项：
  （1）缓存的是读写多线程问题
  （2）列表数据分页缓存
 
 */
@end
