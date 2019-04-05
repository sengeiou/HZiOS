//
//  HZCatagoryTest.m
//  HZFoundation
//
//  Created by apple on 16/12/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZCatagoryTest.h"
#import "HZCatagoryTest+HUA.h"
@implementation HZCatagoryTest
-(void)someLogicMethod{
    self.callBackBlock = ^{
        NSLog(@"回调数据 ok");
    };
    [self detailLogicMehtod];
}

- (void)catagoryP{
    NSLog(@"===>：catagoryP");
}
@end
