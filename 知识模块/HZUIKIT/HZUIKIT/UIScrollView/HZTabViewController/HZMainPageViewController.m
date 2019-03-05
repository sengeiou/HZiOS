//
//  HZMainPageViewController.m
//  HZUIKIT
//
//  Created by apple on 16/9/18.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZMainPageViewController.h"
#import "HZDetailPageViewController.h"
@interface HZMainPageViewController ()

@end

@implementation HZMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor redColor]];
    
    UIButton* pushNextVC = [UIButton buttonWithType:UIButtonTypeCustom];
    [pushNextVC setFrame:CGRectMake(0, 0, 100, 30)];
    [pushNextVC setCenter:self.view.center];
    [pushNextVC setBackgroundColor:[UIColor grayColor]];
    [pushNextVC setTitle:@"nextVC" forState:UIControlStateNormal];
    [pushNextVC addTarget:self action:@selector(gotoNextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushNextVC];
}

-(void)gotoNextVC{
    UIViewController* parentViewController = self.parentViewController;
    HZDetailPageViewController* detailVc = [[HZDetailPageViewController alloc] init];
    [parentViewController.navigationController pushViewController:detailVc animated:YES];
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
