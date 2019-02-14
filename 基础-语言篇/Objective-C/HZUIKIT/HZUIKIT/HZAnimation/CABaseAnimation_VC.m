//
//  CABaseAnimation_VC.m
//  Animation
//
//  Created by apple on 16/2/19.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "CABaseAnimation_VC.h"

@interface CABaseAnimation_VC ()
@end

@implementation CABaseAnimation_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    //self.actionButtonsTitleArray = @[@"位移",@"透明度",@"缩放",@"旋转",@"背景色"];
   // [self setUpView];
}

//-(void)buttonClick:(UIButton *)button{
//    switch (button.tag) {
//        case 0:
//        {
//            [self positionAnimation];
//        }
//            break;
//        case 1:
//        {
//            [self opacityAnimation];
//        }
//            break;
//        case 2:
//        {
//            [self scaleAnimation];
//        }
//            break;
//        case 3:
//        {
//            [self rotateAnimation];
//        }
//            break;
//        case 4:
//        {
//            [self backgroundAnimation];
//        }
//            break;
//    
//    }
//}

//#pragma mark- 位移 
//-(void)positionAnimation{
//    
//    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position"];
//    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 200)];
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
//    animation.duration = 2.0f;
//    //添加下列两个属性会使得view运动之后保持状态不变，但view的实际属性值没有改变
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
//    
//    [self.animationView.layer addAnimation:animation forKey:@"positionAnimation"];
//    /*
//     animation.fromValue : keyPath对应的起始值
//     animation.toValue :  keyPath对应的终止值
//     个人理解：
//       fromValue为view动画起始的锚点，tovalue是view动画终止的锚点，整个动画的轨迹按照fromvalue与tovalue之间建立的直线为轨迹运行；
//     */
//}
//
//#pragma mark- 透明度
//
//-(void)opacityAnimation{
//    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    animation.fromValue = [NSNumber numberWithFloat:0.5f];
//    animation.toValue = [NSNumber numberWithFloat:1.0f];
//    animation.duration = 2.0f;
//    [self.animationView.layer addAnimation:animation forKey:@"opacityAnimation"];
//}
//
//#pragma mark- 缩放
//
//-(void)scaleAnimation{
//    // transform.scale.x 横向缩放
//    // transform.scale.y 纵向缩放
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animation.toValue = [NSNumber numberWithFloat:2.0f];
//    animation.duration = 2.0f;
//    [self.animationView.layer addAnimation:animation forKey:@"scaleAnimation"];
//}
//
//#pragma mark- 旋转
//-(void)rotateAnimation{
////    //绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
////    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
////    animation.toValue = [NSNumber numberWithFloat:M_PI];
////    animation.duration = 2.0f;
////    [self.animationView.layer addAnimation:animation forKey:@"rotateAnimation"];
//    
//    
////        //valueWithCATransform3D作用与layer
////        CABasicAnimation *animation_1 = [CABasicAnimation animationWithKeyPath:@"transform"];
////        animation_1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];//绕着矢量（x,y,z）旋转
////        animation_1.duration = 1.0f;
////        //anima.repeatCount = MAXFLOAT;
////        [self.animationView.layer addAnimation:animation_1 forKey:@"rotateAnimation"];
//    
//        //CGAffineTransform作用与View
//        self.animationView.transform = CGAffineTransformMakeRotation(0);
//        [UIView animateWithDuration:1.0f animations:^{
//            self.animationView.transform = CGAffineTransformMakeRotation(M_PI);
//        } completion:^(BOOL finished) {
//            
//        }];
//}
//
//#pragma mark- 背景颜色变化
//-(void)backgroundAnimation{
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    animation.toValue =(id) [UIColor greenColor].CGColor;
//    animation.duration = 1.0f;
//    [self.animationView.layer addAnimation:animation forKey:@"backgroundAnimation"];
//}
//

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
