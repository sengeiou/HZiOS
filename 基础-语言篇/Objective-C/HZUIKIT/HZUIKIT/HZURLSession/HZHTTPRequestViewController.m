//
//  HZHTTPRequestViewController.m
//  HZUIKIT
//
//  Created by apple on 16/11/24.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZHTTPRequestViewController.h"
#import "AppDelegate.h"
@interface HZHTTPRequestViewController ()<NSURLSessionDelegate>

@end

@implementation HZHTTPRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"request Data" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 100, 50)];
    [button setCenter:self.view.center];
    [button addTarget:self action:@selector(methodDefaultDownLoad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)methodDefaultSession{
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* urlRequest  = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://tcc.taobao.com/cc/json/mobile_tel_segment.htm?tel=18518487767"]];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *pageSource = [[NSString alloc] initWithData:data encoding:gbkEncoding];
        NSLog(@"---->%@",pageSource);
        NSLog(@"--->%@",response);
    }];
    [dataTask resume];
}

-(void)methodDefaultDownLoad{
    NSURL* downLoadURL = [NSURL URLWithString:@"http://dlsw.baidu.com/sw-search-sp/soft/ed/25724/baidumusicmac9.1.1.1427694756.dmg"];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:downLoadURL];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"backgroundAction"] delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask* downLoadTask = [session downloadTaskWithRequest:request];
    [downLoadTask resume];
}

-(void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session{
    AppDelegate *appDelegate =(AppDelegate*)[UIApplication sharedApplication].delegate;
    if (appDelegate.completionHandler) {
        // 所有任务已经执行完毕
        
    }
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
