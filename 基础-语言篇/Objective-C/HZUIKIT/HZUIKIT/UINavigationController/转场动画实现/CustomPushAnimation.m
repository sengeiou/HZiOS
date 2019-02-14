//
//  CustomPushAnimation.m
//  HZUIKIT
//
//  Created by KB on 2018/8/17.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "CustomPushAnimation.h"
#import "UIView+Extension.h"

@implementation CustomPushAnimation

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}



- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 2.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    // 目的ViewController
   UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewKey];
    
    // 起始地址
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewKey];
    //
    
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    CGFloat width = fromViewController.view.width;
    CGFloat height = fromViewController.view.height;
    
    /*
       CGAffineTransformMakeTranslation(),这是一个实现相对位移的函数,“屏幕的左上角(以左上角为相对移动的(0,0)点)”
     */
    toViewController.view.transform = CGAffineTransformMakeTranslation(width, height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromViewController.view.transform = CGAffineTransformMakeTranslation(-width,0);
        
        toViewController.view.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        fromViewController.view.transform = CGAffineTransformIdentity;
        
        // 声明过渡结束时调用 completeTransition: 这个方法
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];

}
@end
