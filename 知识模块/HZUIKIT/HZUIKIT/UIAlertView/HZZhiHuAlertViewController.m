//
//  HZZhiHuAlertViewController.m
//  HZUIKIT
//
//  Created by KB on 2018/7/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZZhiHuAlertViewController.h"

@interface HZZhiHuAlertViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSArray  *dataSource;
@end

@implementation HZZhiHuAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  30 ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (void)initData{
    NSMutableArray *tempArray = [NSMutableArray array];
    for(int i = 0; i < 30; i++){
        [tempArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    self.dataSource = [tempArray copy];
}



-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
