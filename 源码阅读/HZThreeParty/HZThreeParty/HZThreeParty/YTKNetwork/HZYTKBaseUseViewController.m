//
//  HZYTKBaseUseViewController.m
//  HZThreeParty
//
//  Created by apple on 16/12/9.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZYTKBaseUseViewController.h"
#import "HZQueryPhoneNumberBelongToApi.h"
#import "HZGetImageApi.h"

#import "HZRequestPositionAPI.h"

@interface HZYTKBaseUseViewController ()

@end

@implementation HZYTKBaseUseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"request Data" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 100, 50)];
    [button setCenter:self.view.center];
    [button addTarget:self action:@selector(getPosition) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

-(void)requestMethod{
   /*
        [sessionManager GET:@"http://tcc.taobao.com/cc/json/mobile_tel_segment.htm" parameters:@{@"tel":@"18518487767"}
    */
    
    NSString* tel = @"18518487767";
    HZQueryPhoneNumberBelongToApi* queryPhoneNumberBelongToApi = [[HZQueryPhoneNumberBelongToApi alloc] initWithTel:tel];
    [queryPhoneNumberBelongToApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSString* responseText = request.responseString;
        NSLog(@"--->:%@",responseText);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"--->:%@",request.error);
    }];
    
}

-(void)getPosition{
    HZRequestPositionAPI* api = [[HZRequestPositionAPI alloc] initWithAK:@"" coor:@"" mcode:@""];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"---->:%@",request.responseString);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
         NSLog(@"--->:%@",request.error);
    }];
    
}


-(void)resumableDownload{
   HZGetImageApi* getImageApi = [[HZGetImageApi alloc] initWithImageId:@""];
    [getImageApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
