//
//  HZBezierPathViewController.m
//  HZUIKIT
//
//  Created by apple on 17/3/10.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZBezierPathViewController.h"

@interface HZBezierPathViewController ()

@end

@implementation HZBezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    /*
      edgesForExtendedLayout: 默认值为 UIRectEdgeAll.
      automaticallyAdjustsScrollViewInsets属性会自动调整根视图内第一个滚动视图的contentInsets
     */
    self.edgesForExtendedLayout =UIRectEdgeNone;
    
}

- (IBAction)showPictureOnView:(id)sender {
    [self drawRectangleInView];
}

-(void)drawRectangleInView{
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 50, 50)];
    CAShapeLayer* shaperLayer = [[CAShapeLayer alloc] init];
    shaperLayer.path = path.CGPath;
    shaperLayer.fillColor = [UIColor clearColor].CGColor;
    shaperLayer.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:shaperLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
