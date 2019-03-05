//
//  CAGroupAnimation_VC.m
//  Animation
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "CAGroupAnimation_VC.h"

@interface CAGroupAnimation_VC ()

@end

@implementation CAGroupAnimation_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.actionButtonsTitleArray = @[@"同时",@"连续"];
//    [self setUpView];
}

//-(void)buttonClick:(UIButton *)button{
//    switch (button.tag) {
//        case 0:
//        {
//            [self animationAtTheSameTime];
//        }
//            break;
//        case 1:
//        {
//            [self animationContinuous];
//        }
//            break;
//
//    }
//}

#pragma mark- 同时执行动画
//-(void)animationAtTheSameTime{
//    //    //位移动画
//    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-50)];
//    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
//    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
//    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
//    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
//    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50)];
//    anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
//    
//    //缩放动画
//    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
//    anima2.toValue = [NSNumber numberWithFloat:2.0f];
//    
//    //旋转动画
//    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
//    
//    //组动画
//    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
//    groupAnimation.animations = [NSArray arrayWithObjects:anima1,anima2,anima3, nil];
//    groupAnimation.duration = 4.0f;
//    
//    [self.animationView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
//}
//
//#pragma mark-  连续执行动画
//-(void)animationContinuous{
//    CFTimeInterval currentTime = CACurrentMediaTime();
//    //位移动画
//    CABasicAnimation *anima1 = [CABasicAnimation animationWithKeyPath:@"position"];
//    anima1.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-75)];
//    anima1.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2-75)];
//    anima1.beginTime = currentTime;
//    anima1.duration = 1.0f;
//    anima1.fillMode = kCAFillModeForwards;
//    anima1.removedOnCompletion = NO;
//    [self.animationView.layer addAnimation:anima1 forKey:@"aa"];
//    
//    //缩放动画
//    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
//    anima2.toValue = [NSNumber numberWithFloat:2.0f];
//    anima2.beginTime = currentTime+1.0f;
//    anima2.duration = 1.0f;
//    anima2.fillMode = kCAFillModeForwards;
//    anima2.removedOnCompletion = NO;
//    [self.animationView.layer addAnimation:anima2 forKey:@"bb"];
//    
//    //旋转动画
//    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
//    anima3.beginTime = currentTime+2.0f;
//    anima3.duration = 1.0f;
//    anima3.fillMode = kCAFillModeForwards;
//    anima3.removedOnCompletion = NO;
//    [self.animationView.layer addAnimation:anima3 forKey:@"cc"];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
