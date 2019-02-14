//
//  HZSecondNavViewController.m
//  HZUIKIT
//
//  Created by KB on 2018/8/17.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZSecondNavViewController.h"

@interface HZSecondNavViewController ()

@end

@implementation HZSecondNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"HZSecondNavViewController--viewDidDisappear");
}


/*
 
 // 默认push动画
         CATransition *transition = [CATransition animation];
         transition.duration = 0.3f;
         transition.timingFunction = [CAMediaTimingFunctionfunctionWithName:kCAMediaTimingFunctionEaseInEaseOut];
         transition.type = kCATransitionPush;
         transition.subtype = kCATransitionFromRight;
         transition.delegate = self;
         [self.contentView.layer addAnimation:transition forKey:nil];
         [self.contentView addSubview:self.productDetailController.view];
 
 // 默认pop动画
 
         CATransition *transition = [CATransition animation];
         transition.duration = 0.3f;
         transition.timingFunction = [CAMediaTimingFunctionfunctionWithName:kCAMediaTimingFunctionEaseInEaseOut];
         transition.type = kCATransitionPush;
         transition.subtype = kCATransitionFromLeft;
         transition.delegate = self;
         [self.view.superview.layer addAnimation:transition forKey:nil];
         [self.view removeFromSuperview];
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
