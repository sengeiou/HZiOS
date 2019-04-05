//
//  HZFindChar.m
//  HZDataStructure
//
//  Created by KB on 2018/8/15.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZFindChar.h"

/*
   字符是一个长度为8的数据类型，因此总共有256可能；
   每个字母根据ASCII码值作为数组的下标对应数组的一个数字
   数组中存储的是每个字符出现的次数
 */

@implementation HZFindChar

char findChar(char *cha){
    char result = '\0';
    //定义一个数组 用来存储各个字母出现的次数
    int array[256];
    for (int i = 0; i < 256; i++) {
        array[i] = 0;
    }
    
    // 将字母出现的次数存储到指定index处
    char *p = cha;
    while (*p != '\0') {
        array[*p]++;
        p++;
    }
    
    // 将p指针重新指向字符串头部
    p = cha;
    while (*p != '\0') { // 遍历字符串
        // 遇到第一个出现次数为1的字符，打印结果
        if(array[*p] == 1){
            result = *p;
            break;
        }
        // 反之继续向后遍历
        p++;
    }
    
    return result;
}

@end
