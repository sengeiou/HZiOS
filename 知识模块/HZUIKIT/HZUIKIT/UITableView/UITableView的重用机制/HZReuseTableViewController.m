//
//  HZReuseTableViewController.m
//  HZUIKIT
//
//  Created by 华天杰 on 2019/2/25.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import "HZReuseTableViewController.h"

@interface HZReuseTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,copy)NSArray* dataSource;

@end

@implementation HZReuseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifer = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.dataSource[indexPath.row]];
    return  cell;
}

-(NSArray*)dataSource{
    if (_dataSource == nil) {
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSInteger i = 0; i < 100; i++) {
            [tempArray addObject:@(i)];
        }
        _dataSource = [tempArray copy];
    }
    return _dataSource;
}

-(UITableView*)tableView{
    if(_tableView == nil){
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
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
