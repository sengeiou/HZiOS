//
//  HZKVOViewController.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/12.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZKVOViewController.h"
#import "HZKVO.h"
#import "NSObject+KVO.h"

@interface HZKVOViewController ()
@property(nonatomic,strong)HZKVO* kvoObject;
@end

@implementation HZKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.kvoObject = [[HZKVO alloc] init];
    self.kvoObject.name = @"before";
    [self.kvoObject hz_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    self.kvoObject.name = @"after";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    /*
         {
         kind = 1;
         new = after;
         old = before;
         }
     */
    NSLog(@"%@----%@",object,change);
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"%@",[change objectForKey:@"new"]);
    }
}


@end
