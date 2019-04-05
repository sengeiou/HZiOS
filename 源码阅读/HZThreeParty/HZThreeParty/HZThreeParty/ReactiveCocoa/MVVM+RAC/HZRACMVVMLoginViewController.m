//
//  HZRACMVVMLoginViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/11/13.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZRACMVVMLoginViewController.h"

#import <ReactiveObjC.h>
#import "LoginViewModel.h"

@interface HZRACMVVMLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property(nonatomic,strong)LoginViewModel* loginViewModel;

@end

@implementation HZRACMVVMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self loginBind];
}

-(void)loginBind{
    self.loginViewModel = [[LoginViewModel alloc] init];
    
#pragma mark --- 如下使用登录按钮点击获取不到登录密码
    
//    RAC(self.loginViewModel,userName) = RACObserve(self.userNameTF, text);
//    RAC(self.loginViewModel,pwd) = RACObserve(self.pwdTF, text);
    
    RAC(self.loginViewModel,userName) = self.userNameTF.rac_textSignal;
    RAC(self.loginViewModel,pwd) = self.pwdTF.rac_textSignal;
    
    RACSignal *loginBtnEnableSignal = [[RACSignal combineLatest:@[self.userNameTF.rac_textSignal,self.pwdTF.rac_textSignal]] map:^id _Nullable(RACTuple * _Nullable value) {
        return @([value[0] length] >0 && [value[1] length]>=6);
    }];
    
    [self.loginBtn setRac_command:[[RACCommand alloc] initWithEnabled:loginBtnEnableSignal signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            // 执行登录方法
            [self.loginViewModel login];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }]];
    
    [self.loginViewModel.successSignal subscribeNext:^(id  _Nullable x) {
        // 登录成功
        NSLog(@"%@",x);
    }];
}


@end
