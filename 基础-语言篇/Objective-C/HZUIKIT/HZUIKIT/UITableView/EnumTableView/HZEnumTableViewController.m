//
//  HZEnumTableViewController.m
//  HZUIKIT
//
//  Created by KB on 2018/7/26.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZEnumTableViewController.h"
#import "HZRecording.h"
#import "HZRequestRecordService.h"

@interface HZEnumTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *recordings;
@end

@implementation HZEnumTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self loadRecordings];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}


- (void)loadRecordings{
    NSDictionary *requestParams = @{@"query":@"l"};
    [HZRequestRecordService requestRecordServiceWithParams:requestParams completeHandler:^(bool isSuccess, NSString *message, NSArray *result) {
        if (isSuccess) {
            [self.recordings addObjectsFromArray:result];
            [self.tableView reloadData];
        }
    }];
}

#pragma mark UITableViewDelegate and UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.recordings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"recordingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.recordings[indexPath.row];
    [tableView rectForRowAtIndexPath:indexPath];
    return cell;
}

/*
   获取可视化区域的tableViewCell
 
 1 : [tableView visibleCells];
 
 2: [tableView indexPathsForVisibleRows];
 
 3.- (CGRect)rectForRowAtIndexPath:(NSIndexPath*)indexPath;
 CGRect cellFrame = [myTV rectForRowAtIndexPath:indx];

 向上滚动 ： offset.y > cell.y + cellHeight;
 向下滚动： cell.y - offset.y > cellHeight
 */


-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(NSMutableArray *)recordings{
    if (_recordings == nil) {
        _recordings = [NSMutableArray array];
    }
    return _recordings;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
