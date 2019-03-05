//
//  CAKeyframeAnimation_VC.m
//  Animation
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "CAKeyframeAnimation_VC.h"

@interface CAKeyframeAnimation_VC ()

@end

@implementation CAKeyframeAnimation_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // self.actionButtonsTitleArray = @[@"关键帧",@"路径",@"抖动"];
  //  [self setUpView];
}

//-(void)buttonClick:(UIButton *)button{
//    switch (button.tag) {
//        case 0:
//        {
//            [self keyFrameAnimation];
//        }
//            break;
//        case 1:
//        {
//            [self pathAnimation];
//        }
//            break;
//        case 2:
//        {
//            [self shakeAnimation];
//        }
//            break;
//    }
//}
//

//-(void)keyFrameAnimation{
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-50)];
//    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
//    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
//    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
//    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
//    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50)];
//    animation.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
//    animation.duration = 2.0f;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//设置动画的节奏
//    animation.delegate = self;//设置代理，可以检测动画的开始和结束
//    [self.animationView.layer addAnimation:animation forKey:@"keyFrameAnimation"];
//}
//
///**
// *  path动画
// */
//-(void)pathAnimation{
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-100, 200, 200)];
//    animation.path = path.CGPath;
//    animation.duration = 2.0f;
//    [self.animationView.layer addAnimation:animation forKey:@"pathAnimation"];
//}
//
///**
// *  抖动效果
// */
//-(void)shakeAnimation{
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];//在这里@"transform.rotation"==@"transform.rotation.z"
//    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
//    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
//    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
//    animation.values = @[value1,value2,value3];
//    animation.repeatCount = MAXFLOAT;
//    
//    [self.animationView.layer addAnimation:animation forKey:@"shakeAnimation"];
//    
//    
//}
//
//
//-(void)animationDidStart:(CAAnimation *)anim{
//    NSLog(@"animation start!!");
//}
//-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    NSLog(@"animation end!!");
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
