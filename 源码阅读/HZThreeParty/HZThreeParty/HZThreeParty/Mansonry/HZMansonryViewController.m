//
//  HZMansonryViewController.m
//  HZThreeParty
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZMansonryViewController.h"

#import "NSObject+Caculator.h"

@interface HZMansonryViewController ()

@end

@implementation HZMansonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableViewItems = @[@"HZMasonryBaseUseViewController",@"HZEqualWidthViewController",@"HZMasonryScrollViewController",@"HZMasonryTableViewController"];
}

#pragma mark -- 模仿Masonary实现链式调用

-(void)test{
    int result = [NSObject makeCaculators:^(HZCaculatorMaker *make) {
        make.add(1).add(8).sub(2).multiply(3).divide(2);
    }];
    NSLog(@"%d",result);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
