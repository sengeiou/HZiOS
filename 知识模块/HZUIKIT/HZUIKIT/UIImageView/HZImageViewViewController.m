//
//  HZImageViewViewController.m
//  HZUIKIT
//
//  Created by KB on 2017/11/21.
//  Copyright © 2017年 HZ. All rights reserved.
/*
 + imageNamed:
 + imageWithContentsOfFile:
 */

#import "HZImageViewViewController.h"

@interface HZImageViewViewController ()

@end

@implementation HZImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"UIImageView";
    self.tableViewItems = @[@"HZImageViewBannerViewController"];
   
    /*
    UIViewContentModeScaleToFill,
     // 保持宽高比例拉伸，图片居中显示
    UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
    // 宽或高拉伸等于imageView的宽或者高停止拉伸，居中显示
     UIViewContentModeScaleAspectFill
    UIImageView *imageView;
    [imageView setContentMode:(UIViewContentMode)]
     */
}

#pragma mark -- 播放gif
/*
 
         #import <CoreGraphics/CoreGraphics.h>
         #import <ImageIO/ImageIO.h>
 
 
         UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
         imageView.center = self.view.center;
         [self.view addSubview:imageView];
         
          Do any additional setup after loading the view, typically from a nib.
         NSData* imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test.gif" ofType:nil]];
         CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)imageData, NULL);
         size_t count = CGImageSourceGetCount(source);
         NSMutableArray* images = [NSMutableArray array];
         for (size_t i = 0; i<count; i++) {
         CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
         [images addObject:[UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
         CGImageRelease(image);
         }
         CFRelease(source);
         
         [imageView setAnimationImages:images];
         [imageView setAnimationDuration:0.6];
         [imageView startAnimating];
 
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
