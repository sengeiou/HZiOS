//
//  HZExchangeTwoNumber.m
//  Algorithm
//
//  Created by KB on 2018/8/13.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "HZExchangeTwoNumber.h"

@implementation HZExchangeTwoNumber
- (void)resolution{
    // 异或方式交换两个数不使用中间变量
    int a = 10;
    int b = 8 ;
    
    a = a^b;
    b = a^b;
    a = a^b;
    
    printf("a=%d,b=%d\n",a,b);
    
    // 算数方式交换两个数【数轴计算两点之间的距离】
    int x = 8;
    int y = 10;
    x = y-x; // x与y中间的距离
    y = y-x; // x距离原点的距离
    x = x+y; // y距离原点的位置
    
    printf("x=%d,y=%d\n",x,y);
}
@end
