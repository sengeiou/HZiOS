//
//  LoginViewModel.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/11/13.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "LoginViewModel.h"

@interface LoginViewModel()

@end

@implementation LoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _successSignal = [RACSubject subject];
        _failureSignal = [RACSubject subject];
        _errorSignal = [RACSubject subject];
    }
    return self;
}


-(void)login{
    // 使用用户名或密码请求数据
    NSLog(@"%@,%@",_userName,_pwd);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         
        [self.successSignal sendNext:@"login success"];
    });
}
@end
