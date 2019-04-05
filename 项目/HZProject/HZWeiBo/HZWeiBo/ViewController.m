//
//  ViewController.m
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "ViewController.h"

//NSString *const kStringAPPKey = @"1103637002";
//NSString *const kStringAPPSecret = @"4d6e7194c8b6ccf942b048bd86e50641";
//NSString *const kStringRedirectUrl = @"www.baidu.com";
//NSString *const kStringOAuthURL = @"https://api.weibo.com/oauth2/authorize";
//NSString *const kStringAccessTokenURL = @"https://api.weibo.com/oauth2/access_token";
//NSString *const khome_timelineURL = @"https://api.weibo.com/2/statuses/home_timeline.json";

@interface ViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    self.webView.delegate = self;
//    [self.view addSubview:self.webView];
//    
//    //发送网络请求,在webView中打开OAuth认证的网址
//    NSString *strURL = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",kStringOAuthURL,kStringAPPKey,kStringRedirectUrl];
//    NSURL *URL = [NSURL URLWithString:strURL];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL cachePolicy:0 timeoutInterval:-1];
//    [self.webView loadRequest:request];
}

//#pragma mark - 网页视图代理方法
//
//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    NSString *absoluteURL = request.URL.absoluteString;
//    /*
//     //请求
//     https://api.weibo.com/oauth2/authorize?client_id=123050457758183&redirect_uri=http://www.example.com/response&response_type=code
//     */
//
//    if ([absoluteURL hasPrefix:@"http://www.baidu.com"]) {
//        NSRange range = [absoluteURL rangeOfString:@"code="];
//        NSUInteger location = range.location + range.length;
//        NSString *code = [absoluteURL substringFromIndex:location];
//        //进行授权请求
//        if ([code length]) {
//            [self startAccessLoginOAuth:(NSString *)code];
//        }
//    }
//    return YES;
//}
//
//
//#pragma mark - 进行登录授权请求,授权期内不用再进行授权
//-(void)startAccessLoginOAuth:(NSString *)code{
//    NSDictionary *parameters =
//    @{
//      @"client_id":kStringAPPKey,
//      @"client_secret":kStringAPPSecret,
//      @"grant_type":@"authorization_code",
//      @"code":code,
//      @"redirect_uri":@"http://www.baidu.com"
//      };
//
//    [[AFHTTPSessionManager manager] POST:kStringAccessTokenURL parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        /*
//         "access_token" = "2.00RlQrbCo5kgMBf61e4ec83ewActCB";
//         "expires_in" = 157679999;
//         isRealName = true;
//         "remind_in" = 157679999;
//          uid = 2391685915;
//         */
//        NSLog(@"===>:%@",responseObject);
//        [self getUserStatuesInfo:[responseObject objectForKey:@"access_token"]];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"===>:%@",error);
//    }];
//
//}
//
////获取当前用的微博信息
//-(void)getUserStatuesInfo:(NSString *)access_token{
//
//    //设置GET参数
//    NSDictionary *parameters =
//    @{
//      @"client_id":kStringAPPKey,
//      @"client_secret":kStringAPPSecret,
//      @"access_token":access_token,
//      };
//
//    [[AFHTTPSessionManager manager] GET:khome_timelineURL parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSArray *statues = responseObject[@"statuses"];
//        [statues enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        }];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
