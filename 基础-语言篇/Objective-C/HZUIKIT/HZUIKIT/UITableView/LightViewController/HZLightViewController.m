//
//  HZLightViewController.m
//  HZUIKIT
//
//  Created by apple on 16/9/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZLightViewController.h"
#import "HZLightArrayDateSource.h"
#import "HZLightTableViewCell.h"
#import "HZLightTableViewCell+Configure.h"
#import "HZLightPersonModel.h"

@interface HZLightViewController ()
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)HZLightArrayDateSource* lightArrayDateSource;
@end

@implementation HZLightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
}

-(void)setUpTableView{
   // 配置列表数据源
    self.lightArrayDateSource = [[HZLightArrayDateSource alloc] initWithItems:[HZLightPersonModel requestPersonModelList]  cutomerCellClassName:NSStringFromClass([HZLightTableViewCell class])configureCellBlock:^(HZLightTableViewCell* cell, HZLightPersonModel* person) {
        // 配置cell的显示内容
        [cell configureForPerson:person];
    }];
    [self.view addSubview:self.tableView];
}
#pragma mark- setter and getter

-(UITableView*)tableView{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = _lightArrayDateSource;
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
