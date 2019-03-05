//
//  UIButtonViewController.m
//  HZUIKIT
//
//  Created by dafy on 16/8/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "UIButtonViewController.h"

@interface UIButtonViewController ()

@end

@implementation UIButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpView];
}

-(void)setUpView{
    CGFloat margin_left = 40.0f;
    CGFloat margin_top  = 15.0f;
    CGFloat btn_width = 120.0f;
    CGFloat btn_height = 40.0f;
    
    #pragma mark -  UIButton 的基本使用
    
    UIButton* fristBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //正常状态显示文字
    [fristBtn setTitle:@"fristBtn" forState:UIControlStateNormal];
    // 选中状态下显示文字
    [fristBtn setTitle:@"fristBtn_Selected" forState:UIControlStateSelected];
    //设置背景图片
    [fristBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [fristBtn setBackgroundColor:[UIColor orangeColor]];
    [fristBtn setFrame:CGRectMake(margin_left, margin_top, btn_width, btn_height)];
    // 添加点击事件
    [fristBtn addTarget:self action:@selector(fristBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fristBtn];
    
    #pragma mark -  UIButton的组成 (UIButtonLabel和UIImageView)
    
    UIButton* secondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [secondBtn setFrame:CGRectMake(margin_left, margin_top+CGRectGetMaxY(fristBtn.frame), btn_width, btn_height)];
    // 不设置状态的情况下直接设置文本和图片的话不显示
//    secondBtn.titleLabel.text = @"titleLabel";
//    secondBtn.imageView.image = [UIImage imageNamed:@"businessImg"];
    //
    [secondBtn setTitle:@"secondBtn" forState:UIControlStateNormal];
    secondBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    UIImage* secondImage = [UIImage imageNamed:@"buyOne"];
    // 60.000000,60.000000
    NSLog(@"%lf,%lf",secondImage.size.width,secondImage.size.width);
    [secondBtn setImage:[UIImage imageNamed:@"buyOne"] forState:UIControlStateNormal];
    [secondBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    // 可以调整image和title的位置
    [secondBtn setBackgroundColor:[UIColor orangeColor]];
    // <UIButtonLabel: 0x7ff96971e400; frame = (146 12; 52.5 16); text = 'secondBtn'; opaque = NO; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7ff96971e8a0>>
    NSLog(@"%@",secondBtn.titleLabel);
    //<UIImageView: 0x7ff96972f150; frame = (1.5 0; 144 40); clipsToBounds = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x7ff96972ed20>>
    NSLog(@"%@",secondBtn.imageView);
    [self.view addSubview:secondBtn];
    
   #pragma mark -  UIButton 的三个属性 contentEdgeInsets、titleEdgeInsets、imageEdgeInsets
    

   #pragma mark - 圆角UIButton
    
    UIButton* thirdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [thirdBtn setBackgroundColor:[UIColor orangeColor]];
    [thirdBtn setFrame:CGRectMake(margin_left, CGRectGetMaxY(secondBtn.frame)+margin_top, btn_width, btn_height)];
    [thirdBtn setTitle:@"圆角按钮" forState:UIControlStateNormal];
    thirdBtn.layer.cornerRadius = 3.0f;
    thirdBtn.clipsToBounds = YES;
    [self.view addSubview:thirdBtn];
    
    #pragma mark - 切指定位置的圆角
    
    UIButton* fourthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fourthBtn setBackgroundColor:[UIColor orangeColor]];
    [fourthBtn setFrame:CGRectMake(margin_left, CGRectGetMaxY(thirdBtn.frame)+margin_top, btn_width, btn_height)];
    CGRect rect = CGRectMake(0, 0, 100, 50);
    CGSize cornerRadius = CGSizeMake(5.0, 5.0);
    UIRectCorner corner = UIRectCornerTopLeft|UIRectCornerTopRight;
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:cornerRadius];
    CAShapeLayer* maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = fourthBtn.bounds;
    maskLayer.path = path.CGPath;
    fourthBtn.layer.mask = maskLayer;
    [self.view addSubview:fourthBtn];
    
}

-(void)fristBtnAction:(UIButton*)btn{
    [btn setTitle:@"已被点击" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
