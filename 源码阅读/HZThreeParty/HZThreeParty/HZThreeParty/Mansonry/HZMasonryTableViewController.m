//
//  HZMasonryTableViewController.m
//  HZThreeParty
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 HZ. All rights reserved.
/*
 *  tableview的自适应布局
 *
 */

#import "HZMasonryTableViewController.h"
#import "HZMasonryTableViewCell.h"
#import "HZMasonryModel.h"
@interface HZMasonryTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray* dataSource;
@end

@implementation HZMasonryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:self.tableView];
    [self configureView];
}

-(void)configureView{
    [HZMasonryModel loadUserInfoWithCompleteHandler:^(NSArray *dataArray, NSString *message) {
        if (dataArray.count>0) {
            [self.dataSource addObjectsFromArray:dataArray];
            [self.tableView reloadData];
        }else{
            NSLog(@"%@",message);
        }
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HZMasonryTableViewCell* cell = [HZMasonryTableViewCell cellWithTableView:tableView];
    cell.masonryModel = self.dataSource[indexPath.row];
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     HZMasonryModel* masonryModel = self.dataSource[indexPath.row];
      return masonryModel.cellHeight;
}

-(UITableView*)tableView{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
         _tableView.estimatedRowHeight = 140;
    }
    return _tableView;
}

-(NSMutableArray*)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
