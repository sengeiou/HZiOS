//
//  HZEstimateRowHeightViewController.m
//  HZUIKIT
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 HZ. All rights reserved.
//

/*
 estimatedRowHeight 的值尽量设置和基本布局高度相近
 滚动视图之所以能滚动的主要原因是设置了contentSize
 1> iOS11之前是0：
 iOS11之前tableView会调用每个cell的heightForRowAtIndexPath来算出整个高度，从而相加后得出contentSize
 2> iOS11后是默认的44
 iOS11后就不调用heightForRowAtIndexPath，contentSize的计算是调用scrollViewDidScroll根据estimatedRowHeight * 屏幕能显示cell的数量（screenHeight/estimatedRowHeight）
 随着视图的滚动，当要显示新的cell时，会调用一次heightForRowAtIndexPath，同时会计算新的contentSize
 
 为什么使用MJRefresh在iOS11下要让estimatedRowHeight=0?
 因为MJRefresh底部的上拉刷新是根据contentSize来计算的，当数据更新的时候，得出来的contentSize只是预估的
 */

#import "HZEstimateRowHeightViewController.h"

@interface HZEstimateRowHeightViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *tableHeaderView;
@end

@implementation HZEstimateRowHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"heightForRowAtIndexPath--->%ld",indexPath.row);
    /*
       如果返回44，heightForRowAtIndexPath首次加载调用的次数是设置50的2倍
     */
    return 50;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return  cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffY = scrollView.contentOffset.y;
    NSLog(@"===>:%lf",contentOffY);
}

-(UITableView*)tableView{
    if (_tableView == nil) {
        _tableView =  [[UITableView alloc] initWithFrame:self.view.frame];
        _tableView.delegate = self;
        _tableView.estimatedRowHeight = 44;
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.tableHeaderView;
    }
    return _tableView;
}

/*
    (1) contentOffset (x,y)
    列表向上滚动 视图的Y增加，列表向下滚动视图的Y减少，初始为0；
   （2）contentInset
    视图上下左右的偏移量
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
