//
//  HZMethodCallTypesViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/11/11.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZMethodCallTypesViewController.h"

@interface HZMethodCallTypesViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HZMethodCallTypesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // block 类型
    void(^block)()=^(){
        
    };
    block();
    
    // tagert - action 模式
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // 委托代理模式
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    //调用对象模式
    NSBlockOperation *blcokOperation = [NSBlockOperation blockOperationWithBlock:^{
        
    }];
    [[NSOperationQueue mainQueue] addOperation:blcokOperation];
}

- (void)tap{
    NSLog(@"button click!!");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}


- (void)foo{
    // 实例方法
}

+ (instancetype)instance{
    return nil;
}

@end
