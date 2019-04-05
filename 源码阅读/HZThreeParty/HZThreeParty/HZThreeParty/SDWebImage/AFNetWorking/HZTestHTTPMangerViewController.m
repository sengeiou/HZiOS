//
//  HZTestHTTPMangerViewController.m
//  HZThreeParty
//
//  Created by KB on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZTestHTTPMangerViewController.h"
#import "HZHTTPManager.h"

@interface HZTestHTTPMangerViewController ()

@end

@implementation HZTestHTTPMangerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)buttonAction{
    HZHTTPRequestModel *requestModel = [[HZHTTPRequestModel alloc] init];
    requestModel.baseURL = @"https://api.map.baidu.com";
    requestModel.apiCode = @"location/ip";
    requestModel.params = @{
                            @"ak":@"mFdpmvtRaOvlVVU1rIXH4Xvh",
                            @"coor":@"bd09ll",
                            @"mcode":@"com.dafy.YundaiMobile"
                            };
    [HZHTTPManager httpRequestWithModel:requestModel completeHandler:^(bool isSuccess, NSDictionary *result, NSString *message) {
        NSLog(@"----->:%@",result);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
