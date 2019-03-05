//
//  CustomePopAnimation.m
//  HZUIKIT
//
//  Created by KB on 2018/8/17.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "CustomePopAnimation.h"
#import "UIView+Extension.h"

@implementation CustomePopAnimation

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

    // 自定义动画
    toViewController.view.transform = CGAffineTransformMakeTranslation(width, height);

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{

        fromViewController.view.transform = CGAffineTransformMakeTranslation(width, 0);

        toViewController.view.transform = CGAffineTransformIdentity;

    } completion:^(BOOL finished) {

        fromViewController.view.transform = CGAffineTransformIdentity;

        // 声明过渡结束时调用 completeTransition: 这个方法

        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];

    }];
    
}
@end
