//
//  UIScrollViewViewController.m
//  HZUIKIT
//
//  Created by dafy on 16/8/11.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "UIScrollViewViewController.h"
/*
  + 理解UIKit的坐标系：X轴向右，Y轴向下
  + bounds：描述的是视图在自身坐标系的位置和大小
  + frame： 描述的是视图在父视图坐标系的位置和大小
  + 修改视图的bounds时并不会修改视图的frame；
  + UIscrollview滚动的原理是修改自身的bounds，让可视化区域改变，子视图的frame并未改变！
 
 */
@interface UIScrollViewViewController ()
@end

@implementation UIScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"UIScrollview";
    self.tableViewItems = @[@"UIScrollViewAutoLayoutViewController",@"HZScrollViewDelegateControllerViewController",@"HZTabViewController"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)setUpView{
    CGFloat screen_width=[[UIScreen mainScreen] bounds].size.width;
    CGFloat screen_height = [[UIScreen mainScreen] bounds].size.height;
    CGFloat margin_left = 30.0f;
    CGFloat margin_top = 20.0f;
    CGFloat scr_width   = (screen_width-margin_left*2)/2;
    CGFloat scr_height  = 100.0f;
    
    UIScrollView* frist_scrollView  =  [[UIScrollView alloc] initWithFrame:CGRectMake(margin_left, margin_top, scr_width, scr_height)];
    [frist_scrollView setBackgroundColor:[UIColor orangeColor]];
    // 设置scrollView的内容的显示区域，
    [frist_scrollView setContentSize:CGSizeMake(screen_width, 50)];
    // 移动scrollView的位置
    [frist_scrollView setContentOffset:CGPointMake(0, 10) animated:YES];
    [frist_scrollView setContentInset:UIEdgeInsetsMake(10, 0, 0, 0)];
    [self.view addSubview:frist_scrollView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
