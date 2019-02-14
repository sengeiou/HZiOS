//
//  HZUIViewController.m
//  HZUIKIT
//
//  Created by KB on 2018/6/3.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZUIViewController.h"

@interface HZUIViewController ()

@end

@implementation HZUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UIView";
    self.tableViewItems = @[@"HZCircleViewController"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
