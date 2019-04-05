//
//  StaticTest.m
//  HZFoundation
//
//  Created by apple on 16/10/18.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "StaticTest.h"
static NSInteger count = 0;
@implementation StaticTest
-(NSInteger)showResult{
    ++count;
    return count;
}

-(NSInteger)showResult1{
    // 使用static修饰的变量可以用来保存方法被多次调用局部变量的值
    static NSInteger pageCount = 0;
    ++pageCount;
    return pageCount;
    
    /*
     
 
     
     
     
     
     
     
     
     */
}

@end
