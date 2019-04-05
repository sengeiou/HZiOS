//
//  HZTabBarViewController.m
//  HZWeChat
//
//  Created by KB on 2018/6/20.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "HZTabBarViewController.h"
#import "HZWeChatViewController.h"
#import "HZContactViewController.h"
#import "HZDicoverViewController.h"
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
    [self.tabBar setTintColor:[UIColor colorGreenDefault]];
    [self.tabBar setBackgroundColor:[UIColor colorGrayBG]];
}

-(void)setUpUI{
    HZWeChatViewController* weChatVC = [[HZWeChatViewController alloc] init];
    [self addChildViewController:weChatVC title:LOCSTR(@"微信") imageName:@"tabbar_mainframe" selectedImageName:@"tabbar_mainframeHL"];
    
    HZContactViewController* contactVC = [[HZContactViewController alloc] init];
    [self addChildViewController:contactVC title:LOCSTR(@"通讯录") imageName:@"tabbar_contacts" selectedImageName:@"tabbar_contactsHL"];
    
    HZDicoverViewController* discoverVC = [[HZDicoverViewController alloc] init];
    [self addChildViewController:discoverVC title:LOCSTR(@"发现") imageName:@"tabbar_discover" selectedImageName:@"tabbar_discoverHL"];
    
    HZMineViewController* mineVC = [[HZMineViewController alloc] init];
    [self addChildViewController:mineVC title:LOCSTR(@"我的") imageName:@"tabbar_me" selectedImageName:@"tabbar_meHL"];
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
