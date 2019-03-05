//
//  HZCustomerNavViewController.m
//  HZUIKIT
//
//  Created by KB on 2018/7/24.
//  Copyright © 2018年 HZ. All rights reserved.
/*
 
  自定义导航控制器
  （1） 统一设置导航栏左侧按钮
   (2) 设置导航栏字体颜色
 
   (3)可通过设置 navigationItem.titleView自定义导航栏上的视图
   self.navigationItem.titleView = searchBar;
 
 */

#import "HZCustomerNavViewController.h"
#import "UIBarButtonItem+Extension.h"

@interface HZCustomerNavViewController ()<UINavigationControllerDelegate>
@property(nonatomic,strong)id popDelegate;
@end

@implementation HZCustomerNavViewController

+(void)initialize{
    //设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    

    
    // 普通状态
    NSMutableDictionary *textAttrsNormal = [NSMutableDictionary dictionary];
    textAttrsNormal[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrsNormal[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:textAttrsNormal forState:UIControlStateNormal];
    
    // 不可用状态
    NSMutableDictionary *textAttrsDisabled = [NSMutableDictionary dictionary];
    textAttrsDisabled[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    textAttrsDisabled[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    [item setTitleTextAttributes:textAttrsDisabled forState:UIControlStateDisabled];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置左边的箭头按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highlightImage:@"navigationbar_back_highlighted"];
        // 设置右边的更多按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highlightImage:@"navigationbar_more_highlighted"];
    }
}

-(void)back{
    [self popViewControllerAnimated:YES];
}

-(void)more{
    [self popToRootViewControllerAnimated:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
    // 设置导航栏的背景色
   // self.navigationBar.barTintColor = [UIColor orangeColor];
    // 设置导航栏上的字体颜色
//    NSMutableDictionary *textAttrsDisabled = [NSMutableDictionary dictionary];
//    textAttrsDisabled[NSFontAttributeName] = [UIFont systemFontOfSize:14];
//    textAttrsDisabled[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
//    self.navigationBar.titleTextAttributes =textAttrsDisabled ;
}

// 导航控制器跳转完成的控制器
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == self.viewControllers[0]) {
        // 根控制器还原
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }else{
        // 设置手势代理为空
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
