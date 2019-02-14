//
//  HZNeteaseMainViewController.m
//  HZUIKIT
//
//  Created by 华天杰 on 2017/3/27.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZNeteaseMainViewController.h"
#import "HZNEMainPageHeaderViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define HEADER_CONTENT_HEIGHT 40.0f

@interface HZNeteaseMainViewController ()

@end

@implementation HZNeteaseMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout =UIRectEdgeNone;
    [self hz_layoutChildViewController];
}

-(void)hz_layoutChildViewController{
    HZNEMainPageHeaderViewController* pageHeaderVC = [[HZNEMainPageHeaderViewController alloc] init];
    [self addChildViewController:pageHeaderVC];
    [pageHeaderVC didMoveToParentViewController:self];
    [self.view addSubview:pageHeaderVC.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
