//
//  HZCircleViewController.m
//  HZUIKIT
//
//  Created by KB on 2018/6/3.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZCircleViewController.h"
#import "HZCircleView.h"

#import "HZFollowMoveBallView.h"

#import "HZViewLifeCycle.h"

@interface HZCircleViewController ()

@end

@implementation HZCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
}

-(void)setUpUI{
    HZViewLifeCycle *viewLifeCycle = [[HZViewLifeCycle alloc] init];
    viewLifeCycle.frame = CGRectMake(100, 100, 100, 100);
    viewLifeCycle.backgroundColor = [UIColor yellowColor];
    viewLifeCycle.alpha = 0.8;
    [self.view addSubview:viewLifeCycle];
}

-(void)setUpUIOne{
    HZFollowMoveBallView* followMoveBallView = [[HZFollowMoveBallView alloc] initWithFrame:self.view.frame];
    [followMoveBallView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:followMoveBallView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
