//
//  HZMethodViewController.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZMethodViewController.h"
#import "HZMethodForwarding.h"
#import "HZMethodSetAndGet.h"

#import "HZMethodTarget.h"
#import "UIButton+HZ.h"

@interface HZMethodViewController ()
@property(nonatomic,strong)HZMethodTarget * method;
@property(nonatomic,copy)NSString* result;
@end

@implementation HZMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    HZMethodForwarding *method = [HZMethodForwarding new];
//    [method performSelector:@selector(hzMethod)];
    
//    HZMethodSetAndGet * method = [HZMethodSetAndGet new];
//    method.name = @"hz";
//    NSLog(@"%@",method.name);
    
   [self methodThree];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)methodOne{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    HZMethodTarget * method = [HZMethodTarget new];
    NSString * currentDate = [method stringForDate:[NSDate date] usingFormatter:dateFormatter];
    NSLog(@"currentDate:%@",currentDate);
}

- (void)methodTwo{
    HZMethodTarget * method = [HZMethodTarget new];
    SEL aSel = @selector(stringForDate:usingFormatter:);
    NSMethodSignature *methodSignature = [HZMethodTarget instanceMethodSignatureForSelector:aSel];
    NSInvocation *anInvocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [anInvocation setTarget:method];
    [anInvocation setSelector:aSel];
    NSDate *currentDate = [NSDate date];
    [anInvocation setArgument:&currentDate atIndex:2];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    [anInvocation setArgument:&dateFormatter atIndex:3];
    [anInvocation retainArguments];
    [anInvocation invoke];
    //NSString *result = nil;//-[CFString release]: message sent to deallocated instance 0x600002be0bc0
    [anInvocation getReturnValue:&_result];
    NSLog(@"result==>:%@",_result);
}

- (void)methodThree{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 100, 100, 40)];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"onClick" forState:UIControlStateNormal];
    btn.clickInterval = 4.0;
    [btn setBackgroundColor:UIColor.orangeColor];
    [self.view addSubview:btn];
}

-(void)btnClick{
    NSLog(@"btnClick!!!");
}

@end
