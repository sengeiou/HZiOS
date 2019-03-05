//
//  HZWebViewViewController.m
//  HZUIKIT
//
//  Created by KB on 2017/11/22.
//  Copyright © 2017年 HZ. All rights reserved.
/*
 iOS: https://github.com/marcuswestin/WebViewJavascriptBridge
 Android：https://github.com/lzyzsd/JsBridge
 */

#import "HZWebViewViewController.h"

@interface HZWebViewViewController ()
@property(nonatomic,strong)UITextView* textView;
@end

@implementation HZWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.frame];
//    NSString* path = [[NSBundle mainBundle] pathForResource:@"test.html" ofType:nil];
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
//    [self.view addSubview:webView];
    
    self.textView = [[UITextView alloc] initWithFrame:self.view.frame];
    NSString* htmlString = @"" ;
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    self.textView.attributedText = attributedString;
    [self.view addSubview:self.textView];
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
