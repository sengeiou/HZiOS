//
//  HZMainLsitViewController.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/12.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZMainLsitViewController.h"

@interface HZMainLsitViewController ()

@end

@implementation HZMainLsitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = @[@"HZPropertyViewController",@"HZMethodViewController",@"HZKVOViewController"];
}


@end
