//
//  HZCornerRadiusViewController.m
//  HZUIKIT
//
//  Created by 华天杰 on 2019/2/19.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import "HZCornerRadiusViewController.h"

#import "UIView+Extension.h"

@interface HZCornerRadiusViewController ()

@end

@implementation HZCornerRadiusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self methodWithCoreGraphic];
}

/*
   设置view的cornerRadius；
   设置一些简单的按钮控件，图片控件可以直接使用
 */

-(void)methodWithCornerRadius{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view setBackgroundColor:[UIColor orangeColor]];
    view.layer.cornerRadius = 50;
    view.clipsToBounds = YES;
    [self.view addSubview:view];
}

/*
   用贝塞尔曲线做mask圆角
   cpu使用会增加计算，性能最差
 */
-(void)methodWithBezierPath{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view setBackgroundColor:[UIColor orangeColor]];
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:view.bounds];
    shaperLayer.path = aPath.CGPath;
    view.layer.mask = shaperLayer;
    [self.view addSubview:view];
}

/*
   子线程进行绘制，主线程设置绘制的圆角视图，此性能最高
 */

-(void)methodWithCoreGraphic{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view hz_addRounderCornerWithRadius:20 size:view.frame.size backgroundColor:[UIColor orangeColor]];
    [self.view addSubview:view];
}



/*
   设置圆角图片，相对于设置cornerRadius会性能高一些
 */


@end
