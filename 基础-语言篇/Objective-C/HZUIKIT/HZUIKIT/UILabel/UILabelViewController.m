//
//  UILabelViewController.m
//  HZUIKIT
//
//  Created by dafy on 16/8/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "UILabelViewController.h"

#import "HZVerticalAlignmentLabel.h"

/*
  + 避免动态计算UILable需要渲染的宽度和高度，因为这些计算是在主线程中进行是耗时的计算
  + 尽量减少label的使用量（具体评估）
  + numberofline
  + sizetofit
  + frame是否足够渲染，调用linebreakmode
 */

@interface UILabelViewController ()

@end

@implementation UILabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpView];
}

-(void)setUpView{
    
    CGFloat margin_left = 40.0f;
    CGFloat margin_top  = 15.0f + 100.0;
    CGFloat label_width = 100.0f;
    CGFloat label_height = 40.0f;
    
    // 基础显示文字
    UILabel* fristLabel = [[UILabel alloc] init];
    [fristLabel setFrame:CGRectMake(margin_left, margin_top, label_width, label_height)];
    fristLabel.text = @"fristLabeldsfadsfadsf";
    fristLabel.font = [UIFont systemFontOfSize:15.0f];// 文字大小的设置
    fristLabel.textColor = [UIColor orangeColor];// 文字颜色的设置
    fristLabel.shadowColor = [UIColor yellowColor];
    // 根据状态标识切换显示文字的颜色
    fristLabel.highlightedTextColor = [UIColor orangeColor];
    fristLabel.highlighted = YES;
    //根据宽度设置字体的大小
    [fristLabel setAdjustsFontSizeToFitWidth:YES];
    [fristLabel setTextAlignment:NSTextAlignmentCenter];//居中显示
    [self.view addSubview:fristLabel];
    
    // 对特有文字进行颜色标注
    UILabel* secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin_left, CGRectGetMaxY(fristLabel.frame), label_width, label_height)];
    NSMutableAttributedString* textAttributedStr = [[NSMutableAttributedString alloc] initWithString:@"支付金额:100元"];
    [textAttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(5,3)];
    [secondLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [secondLabel setTextAlignment:NSTextAlignmentCenter];
    secondLabel.attributedText = textAttributedStr;
    [self.view addSubview:secondLabel];
    
    // 根据文字的个数动态改变label的frame
    UILabel* thirdLabel = [[UILabel alloc] init];
    thirdLabel.text = @"明白了很多道理，却依然过不好这一生！";
    thirdLabel.font = [UIFont systemFontOfSize:15.0f];
    [thirdLabel setTextAlignment:NSTextAlignmentCenter];//居中显示
    // label 的折行显示最重要的属性设置
    thirdLabel.numberOfLines = 0;
    CGSize thirdLabelSize= [thirdLabel.text boundingRectWithSize:CGSizeMake(label_width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15.0f]} context:nil].size;
    [thirdLabel setFrame:CGRectMake(margin_left, CGRectGetMaxY(secondLabel.frame)+margin_top, label_width, thirdLabelSize.height)];
    thirdLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:thirdLabel];
    
    
    UILabel* fourthLabel_no_set =[[UILabel alloc] init];
    [fourthLabel_no_set setFrame:CGRectMake(margin_left, CGRectGetMaxY(thirdLabel.frame)+margin_top, label_width,label_height)];
    fourthLabel_no_set.textAlignment = NSTextAlignmentCenter;
    fourthLabel_no_set.adjustsFontSizeToFitWidth = YES;
    fourthLabel_no_set.text = @"文字不贴Label的顶部";
    fourthLabel_no_set.layer.borderWidth = 1.0f;
    fourthLabel_no_set.layer.borderColor = [UIColor orangeColor].CGColor;
    [self.view addSubview:fourthLabel_no_set];
    
    // UIlabel 只有横向设置文字，垂直方向只能自定义
    HZVerticalAlignmentLabel* fourthLabel =[[HZVerticalAlignmentLabel alloc] init];
    [fourthLabel setFrame:CGRectMake(CGRectGetMaxX(fourthLabel_no_set.frame), CGRectGetMaxY(thirdLabel.frame)+margin_top, label_width,label_height)];
    fourthLabel.verticalAlignment =  VerticalAlignmentTop;
    fourthLabel.textAlignment = NSTextAlignmentCenter;
    fourthLabel.adjustsFontSizeToFitWidth = YES;
    fourthLabel.text = @"文字贴近Label的顶部";
    fourthLabel.layer.borderWidth = 1.0f;
    fourthLabel.layer.borderColor = [UIColor orangeColor].CGColor;
    [self.view addSubview:fourthLabel];
    
    
    // 滚动文字的Label 实际上可以使用动画来调整UIlabel的frame
    UIView* bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, label_width)];
    bgView.clipsToBounds = YES;
    bgView.center = self.view.center;
    [self.view addSubview:bgView];
    
    UILabel* fifthLabel =[[UILabel alloc] init];
    [fifthLabel setFrame:CGRectMake(0, 0, label_width,label_height)];
    fifthLabel.textAlignment = NSTextAlignmentCenter;
    fifthLabel.adjustsFontSizeToFitWidth = YES;
    fifthLabel.text = @"滚动文字的label的动画";
    [bgView addSubview:fifthLabel];
    [UIView beginAnimations:@"LabelAnimation" context:NULL];
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:1000.0f];
    CGRect labelFrame = fifthLabel.frame;
    labelFrame.origin.x = -labelFrame.size.width;
    fifthLabel.frame = labelFrame;
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
