//
//  CATransition_VC.m
//  Animation
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "CATransition_VC.h"

@interface CATransition_VC ()
@property (nonatomic , assign) NSInteger index;
@end

@implementation CATransition_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //  self.actionButtonsTitleArray = [NSArray arrayWithObjects:@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"Curl",@"UnCurl",@"caOpen",@"caClose", nil];
   // [self setUpView];
}



//-(void)buttonClick:(UIButton*)button{
//    switch (button.tag) {
//        case 0:
//            [self fadeAnimation];
//            break;
//        case 1:
//            [self moveInAnimation];
//            break;
//        case 2:
//            [self pushAnimation];
//            break;
//        case 3:
//            [self revealAnimation];
//            break;
//        case 4:
//            [self cubeAnimation];
//            break;
//        case 5:
//            [self suckEffectAnimation];
//            break;
//        case 6:
//            [self oglFlipAnimation];
//            break;
//        case 7:
//            [self rippleEffectAnimation];
//            break;
//        case 8:
//            [self pageCurlAnimation];
//            break;
//        case 9:
//            [self pageUnCurlAnimation];
//            break;
//        case 10:
//            [self cameraIrisHollowOpenAnimation];
//            break;
//        case 11:
//            [self cameraIrisHollowCloseAnimation];
//            break;
//        default:
//            break;
//    }
//}
//
//
////-----------------------------public api------------------------------------
///*
// type:
// kCATransitionFade;
// kCATransitionMoveIn;
// kCATransitionPush;
// kCATransitionReveal;
// */
///*
// subType:
// kCATransitionFromRight;
// kCATransitionFromLeft;
// kCATransitionFromTop;
// kCATransitionFromBottom;
// */
//
///**
// *  逐渐消失
// */
//-(void)fadeAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = kCATransitionFade;//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    //anima.startProgress = 0.3;//设置动画起点
//    //anima.endProgress = 0.8;//设置动画终点
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"fadeAnimation"];
//}
//
//-(void)moveInAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = kCATransitionMoveIn;//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"moveInAnimation"];
//}
//
//-(void)pushAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = kCATransitionPush;//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"pushAnimation"];
//}
//
//-(void)revealAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = kCATransitionReveal;//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"revealAnimation"];
//}
//
////-----------------------------private api------------------------------------
///*
//	Don't be surprised if Apple rejects your app for including those effects,
//	and especially don't be surprised if your app starts behaving strangely after an OS update.
// */
//
//
///**
// *  立体翻滚效果
// */
//-(void)cubeAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = @"cube";//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"revealAnimation"];
//}
//
//
//-(void)suckEffectAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = @"suckEffect";//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"suckEffectAnimation"];
//}
//
//-(void)oglFlipAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = @"oglFlip";//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"oglFlipAnimation"];
//}
//
//-(void)rippleEffectAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = @"rippleEffect";//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"rippleEffectAnimation"];
//}
//
//-(void)pageCurlAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = @"pageCurl";//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"pageCurlAnimation"];
//}
//
//-(void)pageUnCurlAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = @"pageUnCurl";//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"pageUnCurlAnimation"];
//}
//
//-(void)cameraIrisHollowOpenAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = @"cameraIrisHollowOpen";//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"cameraIrisHollowOpenAnimation"];
//}
//
//-(void)cameraIrisHollowCloseAnimation{
//    [self changeView:YES];
//    CATransition *anima = [CATransition animation];
//    anima.type = @"cameraIrisHollowClose";//设置动画的类型
//    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 1.0f;
//    
//    [self.animationView.layer addAnimation:anima forKey:@"cameraIrisHollowCloseAnimation"];
//}
//
//
//
///**
// *   设置view的值
// */
//-(void)changeView : (BOOL)isUp{
//    if (_index>3) {
//        _index = 0;
//    }
//    if (_index<0) {
//        _index = 3;
//    }
//    NSArray *colors = [NSArray arrayWithObjects:[UIColor cyanColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor purpleColor], nil];
//    self.animationView.backgroundColor = [colors objectAtIndex:_index];
//    if (isUp) {
//        _index++;
//    }else{
//        _index--;
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

