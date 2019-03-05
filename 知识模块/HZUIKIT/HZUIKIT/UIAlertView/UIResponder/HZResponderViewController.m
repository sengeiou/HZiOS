//
//  HZResponderViewController.m
//  HZUIKIT
//
//  Created by apple on 16/9/22.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZResponderViewController.h"

@interface HZResponderViewController ()

@end

@implementation HZResponderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   /*
    判断当前触摸点是否在轮询的视图中 ，如果是就返回该视图作为时间的响应者 -(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
    
    UIApplication-->sendEvent--->UIWindow-->
    
    1>函数调用栈的详细
    http://ww4.sinaimg.cn/mw690/8e8e3b1bjw1f82cad8b5pj20v00ir108.jpg
    2>
    
    
    */
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 30);
    [button setBackgroundColor:[UIColor orangeColor]];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside ];
    [self.view addSubview:button];
}

-(void)buttonClick:(UIButton*)button{
    NSLog(@"buttonClick!");
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
