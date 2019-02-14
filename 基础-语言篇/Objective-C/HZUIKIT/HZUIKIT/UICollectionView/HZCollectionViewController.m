//
//  HZCollectionViewController.m
//  HZUIKIT
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZCollectionViewController.h"

@interface HZCollectionViewController ()

@end

@implementation HZCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UICollectionViewController";
    self.tableViewItems = @[@"HZHorizontalFlowCollectionViewController",@"HZCollectionViewHeaderViewController",@"HZWaterfallViewController",@"HZCardOverLayViewController"];
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
