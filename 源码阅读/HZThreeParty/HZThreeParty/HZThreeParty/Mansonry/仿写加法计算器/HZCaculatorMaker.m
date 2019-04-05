//
//  HZCaculatorMaker.m
//  HZThreeParty
//
//  Created by KB on 2018/8/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZCaculatorMaker.h"

@implementation HZCaculatorMaker
-(HZCaculatorMaker *(^)(int))add{
    return ^HZCaculatorMaker *(int value){
        _result += value;
        return self;
    };
}

-(HZCaculatorMaker *(^)(int))sub{
    return ^HZCaculatorMaker *(int value){
        _result -= value;
        return self;
    };
}
-(HZCaculatorMaker *(^)(int))multiply{
    return ^HZCaculatorMaker *(int value){
        _result *= value;
        return self;
    };
}
-(HZCaculatorMaker *(^)(int))divide{
    return ^HZCaculatorMaker *(int value){
        if (value == 0) {
            _result = -999999999;
        }
        _result /= value;
        return self;
    };
}
@end
