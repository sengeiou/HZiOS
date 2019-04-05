//
//  HZTabBarViewController.m
//  HZWeChat
//
//  Created by KB on 2018/6/20.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "HZTabBarViewController.h"
#import "HZHomeViewController.h"
#import "HZMessageViewController.h"
#import "HZPostViewController.h"
#import "HZFindViewController.h"
#import "HZMineViewController.h"
#import "HZNavigationController.h"

@interface HZTabBarViewController ()

@end

@implementation HZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    
    /*
       Tabbar的字体颜色和选中图标颜色保持一致
     */
    [self.tabBar setTintColor:[UIColor orangeColor]];
    [self.tabBar setBackgroundColor:[UIColor colorGrayBG]];
}

-(void)setUpUI{
    HZHomeViewController* homeVC = [[HZHomeViewController alloc] init];
    [self addChildViewController:homeVC title:LOCSTR(@"首页") imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    HZMessageViewController* messageVC = [[HZMessageViewController alloc] init];
    [self addChildViewController:messageVC title:LOCSTR(@"消息") imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    HZPostViewController* postVC = [[HZPostViewController alloc] init];
    [self addChildViewController:postVC title:@"发微博" imageName:@"tabbar_compose_icon_add" selectedImageName:@"tabbar_compose_icon_add_selected"];
    
    HZFindViewController* findVC = [[HZFindViewController alloc] init];
    [self addChildViewController:findVC title:LOCSTR(@"发现") imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    HZMineViewController* mineVC = [[HZMineViewController alloc] init];
    [self addChildViewController:mineVC title:LOCSTR(@"我的") imageName:@"tabbar_profile_selected" selectedImageName:@"tabbar_profile"];
}

- (void)addChildViewController:(UIViewController *)childController
                         title:(NSString*)title
                     imageName:(NSString*)imageName
             selectedImageName:(NSString*)selectedImageName{
    UIImage* image = [UIImage imageNamed:imageName];
    UIImage* selectedImage =[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//避免系统再次渲染
    UITabBarItem* tabBarItem =[[UITabBarItem alloc] initWithTitle:title
                                                            image:image
                                                    selectedImage:selectedImage];
    childController.tabBarItem =tabBarItem;
    HZNavigationController* child_Nav =[[HZNavigationController alloc] initWithRootViewController:childController];
    childController.title = title;
    [self addChildViewController:child_Nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
