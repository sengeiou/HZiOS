//
//  NSObject+Caculator.m
//  HZThreeParty
//
//  Created by KB on 2018/8/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "NSObject+Caculator.h"

@implementation NSObject (Caculator)
+ (int)makeCaculators:(void(^)(HZCaculatorMaker *make))caculatorMaker{
    HZCaculatorMaker *make = [[HZCaculatorMaker alloc] init];
    caculatorMaker(make);
    return make.result;
}
@end
