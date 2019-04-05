//
//  HZMBlock.m
//  HZFoundation
//
//  Created by KB on 2018/7/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZMBlock.h"

#import "HZBall.h"

@implementation HZMBlock
- (void)testMethod{
    
    // 实现OC的链式编程
    HZBall *ball = [HZBall new];
    ball.up().down().left().right().doSomething(@"run!!");
    
//    __block int sum = 0;
//
//    int(^sumBlock)(int a,int b) = ^(int a,int b){
//        sum = 2;
//        return a + b;
//    };
//
//    sumBlock(1,2);
    
    
//    __block int  multiplier = 6;
//    int(^Blcok)(int) = ^int(int num){
//        return multiplier * num;
//    };
//    multiplier = 4;
//    NSLog(@"%d",Block(2));// 结果为 8
}
@end
