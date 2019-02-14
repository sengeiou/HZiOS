//
//  UIControlViewController.m
//  HZUIKIT
//
//  Created by dafy on 16/8/8.
//  Copyright © 2016年 HZ. All rights reserved.
/*
 
   参考地址：http://southpeak.github.io/blog/2015/12/13/cocoa-uikit-uicontrol/
 */

#import "UIControlViewController.h"
#import "HZImageControl.h"
@interface UIControlViewController ()

@end

@implementation UIControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupView];
}

-(void)setupView{
    CGFloat margin_left = 40.0f;
    CGFloat margin_top  = 15.0f;
    CGFloat control_width = 120.0f;
    CGFloat control_height = 40.0f;
    
    HZImageControl* imageControl = [[HZImageControl alloc] initWithFrame:CGRectMake(margin_left, margin_top, control_width, control_height) title:@"label" image:[UIImage imageNamed:@"buyOne"]];
    imageControl.layer.borderWidth = 1.0f;
    imageControl.layer.borderColor = [UIColor orangeColor].CGColor;
    // target-action 模式
    [imageControl addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:imageControl];
    // 调用此方法相当于直接触发action的行为
    [imageControl sendActionsForControlEvents:UIControlEventTouchUpInside];
}

-(void)clickAction{
    NSLog(@"clickAction!!!!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
