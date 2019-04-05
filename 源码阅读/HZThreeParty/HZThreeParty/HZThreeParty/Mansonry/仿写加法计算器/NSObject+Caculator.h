//
//  NSObject+Caculator.h
//  HZThreeParty
//
//  Created by KB on 2018/8/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZCaculatorMaker.h"
@interface NSObject (Caculator)

+ (int)makeCaculators:(void(^)(HZCaculatorMaker *make))caculatorMaker;

@end
