//
//  HZReverseString.m
//  HZDataStructure
//
//  Created by 华天杰 on 2018/8/14.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZReverseString.h"

@implementation HZReverseString

void char_reverse(char* cha){
    // 指向第一个字符
    char* begin = cha;
    // 指向最后一个字符
    char* end = cha + strlen(cha) - 1;
    
    while (begin < end) {
        char temp = *begin;
        *(begin++) = *end;
        *(end--) = temp;
    }
}
@end
