//
//  HZKVCViewController.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2019/1/20.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import "HZKVCViewController.h"

#import "HZKVC.h"

@interface HZKVCViewController ()

@end

@implementation HZKVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     HZKVC *kvc = [HZKVC new];
    [kvc setValue:@"name" forKey:@"name"]; // setValue: forKey ==> 如果没有对应属性会i崩溃
    
}


@end
