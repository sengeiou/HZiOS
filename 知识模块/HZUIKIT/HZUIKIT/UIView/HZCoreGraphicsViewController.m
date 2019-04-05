//
//  HZCoreGraphicsViewController.m
//  HZUIKIT
//
//  Created by KB on 2018/6/3.
//  Copyright © 2018年 HZ. All rights reserved.
/*
  Core Graphics 提供了一套2D绘图功能的C语言API；
 */

#import "HZCoreGraphicsViewController.h"


#import "UIView+Extension.h"

#import "AsyncDrawingView.h"
#import "AsyncLabel.h"

@interface HZCoreGraphicsViewController ()

@end

@implementation HZCoreGraphicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

#pragma mark -- 使用分类获取UIView的frame信息
//    CGFloat x = self.view.x;
//    CGFloat y = self.view.y;
//    CGFloat width = self.view.width;
//    CGFloat height = self.view.height;
//    CGSize  size = self.view.size;
//    CGPoint origin = self.view.origin;
    
    AsyncDrawingView * asyncView = [[AsyncDrawingView alloc] init];
    asyncView.frame = CGRectMake(100, 100, 150, 100);
    asyncView.backgroundColor = [UIColor lightGrayColor];
    asyncView.text = @"测试异步绘制layerd加载视图";
    asyncView.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:asyncView];
    [asyncView.layer setNeedsDisplay];
    
    
    AsyncLabel * asyncLabel = [AsyncLabel new];
    [asyncLabel setFrame:CGRectMake(100, CGRectGetMaxY(asyncView.frame) + 50, 150, 150)];
    asyncLabel.text = @"YYAsyncLayer text ";
    asyncLabel.font = [UIFont systemFontOfSize:20.0f];
    asyncLabel.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:asyncLabel];
    [asyncLabel setNeedsDisplay];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
