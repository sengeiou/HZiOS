//
//  HZRACLoginViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/11/11.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZRACLoginViewController.h"

#import <ReactiveObjC.h>

@interface HZRACLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation HZRACLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

#pragma mark -- RAC实现密码和用户名检查控制按钮是否可用
    
    
//    RACSignal *enableSingal = [self.userNameTF.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
//        return @(value.length > 0);
//    }];
    
    RACSignal *combineSingal = [[RACSignal combineLatest:@[self.userNameTF.rac_textSignal,self.pwdTF.rac_textSignal]] map:^id _Nullable(RACTuple * _Nullable value) {
        return @([value[0] length] >0 && [value[1] length] >=6);
    }];
    
    self.loginBtn.rac_command = [[RACCommand alloc] initWithEnabled:combineSingal signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal empty];
    }];
    
    
#pragma mark -- 普通实现
    
//    self.userNameTF.delegate = self;
//    self.pwdTF.delegate = self;
//
//    self.loginBtn.enabled = NO;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    // 拿到当前textfiled显示的文本
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSString *s1 = self.userNameTF.text;
    NSString *s2 = self.pwdTF.text;
    if (textField == self.userNameTF) {
        s1 = str;
    }else{
        s2 = str;
    }
    
    if (s1.length > 0 && s2.length >= 6) {
        self.loginBtn.enabled = YES;
    }else{
        self.loginBtn.enabled = NO;
    }
    
    NSLog(@"%@,%@",s1,s2);
    
    return YES;
}

@end
