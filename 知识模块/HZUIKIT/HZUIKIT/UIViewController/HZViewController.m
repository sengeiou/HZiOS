//
//  HZViewController.m
//  HZUIKIT
//
//  Created by apple on 16/9/13.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZViewController.h"
#import "HZChildrenViewController.h"
@interface HZViewController ()

@end

@implementation HZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    HZChildrenViewController* child_vc = [[HZChildrenViewController alloc] init];
    [child_vc.view setFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height/2)];
    [self addChildViewController:child_vc];
    [self.view addSubview:child_vc.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
