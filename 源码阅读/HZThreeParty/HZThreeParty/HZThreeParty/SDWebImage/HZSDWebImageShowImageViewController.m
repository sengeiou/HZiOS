//
//  HZSDWebImageShowImageViewController.m
//  HZThreeParty
//
//  Created by apple on 16/10/26.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZSDWebImageShowImageViewController.h"

#import <UIImageView+WebCache.h>
@interface HZSDWebImageShowImageViewController ()

@end

@implementation HZSDWebImageShowImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setImageFromURLToImageView];
}

#pragma mark- 给UIImage设置远程图片
-(void)setImageFromURLToImageView{
    UIImageView*  imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [imageView setShowActivityIndicatorView:YES];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/rs/SDWebImage/master/SDWebImage_logo.png"] placeholderImage:[UIImage imageNamed:@"df_icon_live_shjf"]];
    [self.view addSubview:imageView];
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
