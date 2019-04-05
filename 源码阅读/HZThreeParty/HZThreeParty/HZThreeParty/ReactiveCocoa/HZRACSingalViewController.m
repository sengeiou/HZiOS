//
//  HZRACSingalViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/11/11.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZRACSingalViewController.h"

#import <ReactiveObjC.h>
@interface HZRACSingalViewController ()
@end

@implementation HZRACSingalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // RACSignal(信号量):可以理解为面向对象中调用的方法的本身，可以理解为功能更强大的operation/blcok
    RACSignal *viewDidAppearSingal = [self rac_signalForSelector:@selector(invokeMethodWithMessage:)];
    // 订阅方法的next
    [viewDidAppearSingal subscribeNext:^(id x) {
        NSLog(@"%@",x); // x 是方法参数的值， 类型是RACTuple【和swift元组类似】
        NSLog(@"%s",__func__);
    }];
    // 订阅的方法成功完成后会触发
    [viewDidAppearSingal subscribeCompleted:^{
        NSLog(@"----:subscribeCompleted");
    }];
    // 订阅的方法失败后会触发
    [viewDidAppearSingal subscribeError:^(NSError *error) {

    }];
    
    [self invokeMethodWithMessage:@"123"];
    
    //target - action 模式的RAC
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setBounds:CGRectMake(0, 0, 100, 50)];
    button.center = self.view.center;
    [button setTitle:@"click" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    /*
       第一个blockd代表button是否可用的block
       第二block返回按钮点击后具体执行的动作
     */
    [button setRac_command:[[RACCommand alloc]initWithEnabled:nil signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        // 返回的singal中是点击button具体执行的内容
        return  [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSLog(@"button click");
           
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 延迟向订阅者发送消息（此时按钮不可点击）
                [subscriber sendNext:[[NSDate date]description]]; // subscriber --> self(当前的viewcontroller)
                [subscriber sendCompleted]; // 执行完毕
            });
            
            // 需要释放的d对象在此block中执行
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }]];
    
    // 订阅者获取订阅的内容
    [[[button rac_command] executionSignals] subscribeNext:^(RACSignal<id> * _Nullable x) {
        [x subscribeNext:^(id  _Nullable x) {
            NSLog(@"===》：%@",x);// 订阅到的内容
        }];
    }];
}

-(void)invokeMethodWithMessage:(NSString*)message{
    NSLog(@"%s",__func__);
}



#pragma mark -- 信号的生命周期

- (void)lifeCycleOfSignal{
    // 信号的创建
    RACSignal *singal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        // 被订阅了才会执行
        NSLog(@"订阅一下内容");
        [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
            [subscriber sendNext:@"一月份的《读者》"];
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
            [subscriber sendNext:@"二月份的《读者》"];
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
            [subscriber sendNext:@"三月份的《读者》"];
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:4 schedule:^{
            [subscriber sendNext:@"四月份的《读者》"];
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:5 schedule:^{
            [subscriber sendCompleted];// 结束订阅
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    
    //信号的订阅
    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
        [singal subscribeNext:^(id  _Nullable x) {
            NSLog(@"订阅的内容：%@",x);
        }];
    }];
}



@end
