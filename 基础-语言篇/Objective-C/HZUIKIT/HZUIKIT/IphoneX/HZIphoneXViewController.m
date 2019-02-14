//
//  HZIphoneXViewController.m
//  HZUIKIT
//
//  Created by 华天杰 on 2018/9/26.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZIphoneXViewController.h"

// 判断的当前设备是否为iphoneX
#define statusBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height) // 状态栏的高度（20/44）
#define KIsiphoneX  (statusBarHeight == 44.0 ? YES : NO)

static inline BOOL isIPhoneXSeries() {
    BOOL iPhoneXSeries = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
    }
    
    return iPhoneXSeries;
}

// 适配iPhone XS/ iPhone XS Max / iPhone XR
/*
   launchImage:
   iPhone X / iPhone XS ： 1125px * 2436px
   iPhone XR ：828px * 1792px
   iPhone XS Max : 1242px * 2688px
 */

@interface HZIphoneXViewController ()

@end

@implementation HZIphoneXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
