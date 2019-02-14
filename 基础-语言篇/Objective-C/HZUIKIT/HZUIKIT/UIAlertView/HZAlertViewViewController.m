//
//  HZAlertViewViewController.m
//  HZUIKIT
//
//  Created by dafy on 16/8/19.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZAlertViewViewController.h"

#import <objc/runtime.h>
#import "UIView+Extension.h"
@interface HZAlertViewViewController ()<UIAlertViewDelegate>
@property(nonatomic,strong)UIView *popView;
@property(nonatomic,strong)UIView *garyView;
@property(nonatomic,assign)CGPoint touchPoint;
@end

@implementation HZAlertViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.width - 50 - 50, 150, 50, 50);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(showPopView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


-(void)showPopView:(UIButton*)button{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].delegate.window;
    [keyWindow addSubview:self.garyView];
    
    CGFloat marginLeft = 30.0f;
    CGFloat width = self.view.width - marginLeft * 2;
    CGFloat height = 44.0 * 2;
    self.popView.frame = CGRectMake(button.x + button.width/2, button.y + button.height/2, 0, 0);
    [keyWindow addSubview:self.popView];
    
    [UIView animateWithDuration:1.5
                          delay:0
         usingSpringWithDamping:0.7 // 系数越小 弹簧效果越明显[0.0 ~ 1.0]
          initialSpringVelocity:0.9 // 则表示初始的速度，数值越大一开始移动越快。[0 ~ 100]
                        options:UIViewAnimationOptionTransitionNone
                     animations:^{
        CGRect frame = self.popView.frame;
        frame.size.width = width;
        frame.size.height = height;
        frame.origin.x = marginLeft;
        frame.origin.y +=  20;
        self.popView.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
}

-(UIView *)popView{
    if (_popView == nil) {
        _popView = [[UIView alloc] init];
        _popView.backgroundColor = UIColor.whiteColor;
    }
    return _popView;
}

-(UIView *)garyView{
    if (_garyView == nil) {
        _garyView = [[UIView alloc] init];
        _garyView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
        _garyView.backgroundColor = [UIColor blackColor];
        _garyView.alpha = 0.3f;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removePopView)];
        [_garyView addGestureRecognizer:tap];
    }
    return _garyView;
}

-(void)removePopView{
    [self.garyView removeFromSuperview];
    [self.popView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
