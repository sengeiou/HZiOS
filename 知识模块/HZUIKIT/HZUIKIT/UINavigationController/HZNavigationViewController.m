//
//  HZNavigationViewController.m
//  HZUIKIT
//
//  Created by KB on 2018/7/24.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZNavigationViewController.h"

@interface HZNavigationViewController ()

@end

@implementation HZNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"HZNavigationViewController ";
    self.tableViewItems = @[@"HZCustomerNavViewController",@"HZFirstNavViewController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
