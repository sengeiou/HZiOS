//
//  YYImageViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/17.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "YYImageViewController.h"
#import <YYImage.h>
#import <YYAnimatedImageView.h>
#import <YYFrameImage.h>

/*
（1）获取文件的名称和后缀
 NSString *res = name.stringByDeletingPathExtension;
 NSString *ext = name.pathExtension;// 获取图片的后缀
 
 (2) [[UIScreen main] scale] 代表获取屏幕的分辨率
 [[UIScreen main] scale] == 1; //代表320 x 480 的分辨率
 [[UIScreen main] scale] == 2; //代表640 x 960 的分辨率
 [[UIScreen main] scale] == 3; //代表1242 x 2208 的分辨率
 */

@interface YYImageViewController ()

@end

@implementation YYImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showFrameImage];
    

}

#pragma mark -- 显示动画类型的图片

- (void)showGifImage{
    // YYImage 是一个显示动态图片数据的高级别类
    /*
      (1) 判断图片是否在沙盒中存在
     （2）将图片转化为NSData类型
     （3）使用YYImageDecoder对NSData数据进行解码操作
     （4）最后返回UIImage对象
     */
    UIImage *gifImage = [YYImage imageNamed:@"niconiconi@2x.gif"];
    UIImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:gifImage];
    imageView.frame = CGRectMake(50, 150, 200, 200);
    [self.view addSubview:imageView];
    
    /*
     
     (1) 锁机制 ：
     dispatch_semaphore_t lock = dispatch_semaphore_create(1);
     dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
      锁主要是保证 _preloadedFrames【NSArray】 的读写安全，耗时短，使用信号量性能很好
     dispatch_semaphore_signal(lock);
     
     （2）互斥锁 (图像解码操作时)
       pthread_mutex_init_recursive(&_lock, true);
       pthread_mutex_t _lock
       pthread_mutex_lock(&_lock);
       pthread_mutex_unlock(&_lock);
     */
}

- (void)showFrameImage{
    NSArray *paths = @[@"v2_pullRefresh1@2x.png",@"v2_pullRefresh2@2x.png"];
    YYFrameImage *frameImage = [[YYFrameImage alloc] initWithImagePaths:paths oneFrameDuration:2/60 loopCount:YES];
    UIImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:frameImage];
    imageView.frame = CGRectMake(50, 150, 40, 40);
    [self.view addSubview:imageView];
}

#pragma mark -- 超大图片处理


/**
 将图片压缩到指定的大小

 @param targetSize 目标大小
 @param originalImage 原图像
 @return 压缩后的图像
 */
- (UIImage*)imageCompressToTargetSize:(CGSize)targetSize originalImage:(UIImage*)originalImage{
    UIGraphicsBeginImageContext(targetSize);
    [originalImage drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    UIImage *targetImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return targetImage;
}

@end
