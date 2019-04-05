//
//  HZMainLsitViewController.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/12.
//  Copyright © 2018年 HZ. All rights reserved.
//

/*
 Objective-C的知识点
 + 什么是分类
 + 分类的实现原理
 + 能否为分类增加属性
 + 扩展 【分类与扩展的区别】
 + 代理
 + 通知
 + KVO【实现机制】
 + KVC 【实现原理】
 + 属性关键字
 
 */

#import "HZMainLsitViewController.h"

@interface HZMainLsitViewController ()

@end

@implementation HZMainLsitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = @[@"HZPropertyViewController",@"HZMethodViewController",@"HZCatagoryViewController",@"HZKVOViewController",@"HZKVCViewController",@"HZSetsViewController"];
}


@end
