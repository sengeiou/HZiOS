//
//  HZFirstNavViewController.m
//  HZUIKIT
//
//  Created by KB on 2018/8/17.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZFirstNavViewController.h"
#import "HZSecondNavViewController.h"

#import "CustomPushAnimation.h"
#import "CustomePopAnimation.h"

#import "CustomSuperPushAnimation.h"

@interface HZFirstNavViewController ()<UINavigationControllerDelegate>
@property(nonatomic,strong)CustomPushAnimation *customPushAnimation;
@property(nonatomic,strong)CustomePopAnimation *customePopAnimation;
@end

@implementation HZFirstNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
//    self.navigationController.delegate = self;
   

    [self setUpSubViews];
}

- (void)setUpSubViews{
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.frame = CGRectMake(100, 100, 200, 50);
    [pushBtn addTarget:self action:@selector(pushToSecondNav) forControlEvents:UIControlEventTouchUpInside];
    [pushBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [pushBtn setTitle:@"push to secondNav" forState:UIControlStateNormal];
    [self.view addSubview:pushBtn];
}

-(void)pushToSecondNav{
    
//    CustomSuperPushAnimation * customSuper = [[CustomSuperPushAnimation alloc] init];
//
//      _customPushAnimation = [[CustomPushAnimation alloc] init];
    HZSecondNavViewController *secondNavVC = [HZSecondNavViewController new];
    [self.navigationController pushViewController:secondNavVC animated:YES];
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"HZFirstNavViewController---viewDidDisappear");
}


//-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
//    if (operation == UINavigationControllerOperationPush) {
//        return _customPushAnimation;
//    }else if (operation == UINavigationControllerOperationPop) {
//        return _customePopAnimation;
//    }else{
//        return nil;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
