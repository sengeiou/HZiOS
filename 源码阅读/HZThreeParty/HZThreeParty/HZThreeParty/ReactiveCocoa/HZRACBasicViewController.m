//
//  HZRACBasicViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/11/14.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZRACBasicViewController.h"

#import <ReactiveObjC.h>
/*
  +  RAC的便利之处在于提供了统一的方式去处理异步行为，包含delegate、block、target-action、notification、KVO；
 */

@interface HZRACBasicViewController ()
@property(nonatomic,copy)NSString* userName;

@property(nonatomic,assign)BOOL createEnable;
@property(nonatomic,copy)NSString* password;
@property(nonatomic,copy)NSString* passwordConfirmation;

@property(nonatomic,strong)UIButton* button;

@property(nonatomic,strong)UIButton* loginButton;
@end

@implementation HZRACBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark -- 监测属性的变化，类似KVO，但比KVO功能更加强大

-(void)observerProperty{
    /*
     RACObserve产生了一个RACSignal的信号s1，向s1发送subscribeNext表示订阅了s1，
     userName的值发生改变，则subscribe就会触发sendtext，进而调用nextBlock
     */
    [RACObserve(self, userName) subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);// userName 有新值产生则h会回调nextBlock
    }];
    
    /*
       使用filter函数则会生成一个新的signal，
     */
    [[RACObserve(self, userName) filter:^BOOL(id  _Nullable value) {
        return @([value length] >4); // 当返回值为真时才会执行nextBlock
    }] subscribeNext:^(id  _Nullable x) {
         NSLog(@"%@",x);
    }] ;
    
}

#pragma mark -- RAC的信号可以被用来推导状态

-(void)deriveState{
    
    // 属性值与控件进行绑定，实时更新，然后由属性值组合推导出其他属性值的状态
    
    /*
     RAC(self,password) = self.passwordTF.rac_textSignal;
     RAC(self,passwordConfirmation) = self.passwordConfirmationTF.rac_textSignal;
     */
    
    // 当_password和_passwordConfirmation相等时，createEnable为YES；
    RAC(self,createEnable) = [RACSignal combineLatest:@[RACObserve(self, password),RACObserve(self, passwordConfirmation)] reduce:^id _Nullable{
        return @([_password isEqualToString:_passwordConfirmation]);
    }];
}

#pragma mark -- button的点击事件

-(void)buttonTap{
    self.button.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"button is click");
        return [RACSignal empty];
    }];
}

- (void)buttonTapRequestData{
    RACCommand *loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [self login];
    }];
    
    [loginCommand.executionSignals subscribeNext:^(id  _Nullable loginSignal) {
        //loginSignal
        [loginSignal subscribeNext:^(id  _Nullable x) {
            // 获取登录的状态
        }];
    }];
    self.loginButton.rac_command = loginCommand;
}

-(RACSignal*)login{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
         // 网络请求
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"login state"];
        });
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

#pragma mark -- 当两个网络请求都返回后再执行业务操作

-(void)mergeTwoNetworkRequest{
    [[RACSignal merge:@[[self login],[self login]]] subscribeCompleted:^{
        
    }];
    
}

@end
