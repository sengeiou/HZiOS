//
//  HZPropertyViewController.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/24.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZPropertyViewController.h"

#import "HZProperty.h"
#import "HZProperty+HZ.h"

@interface HZPropertyViewController ()

@end

@implementation HZPropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HZProperty * pro = [HZProperty new];
    pro.name = @"name";
    NSLog(@"===>:%@",pro.name);
    [pro method];
}


@end
