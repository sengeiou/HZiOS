//
//  MovieListViewController.m
//  MVVM&VIPER
//
//  Created by KB on 2018/6/21.
//  Copyright © 2018年 BQ. All rights reserved.
/*
 
  https://juejin.im/post/5b28c767e51d4558a3051f48 【MVVM / VIPER】
 */

#import "MovieListViewController.h"
#import "MovieListViewDataController.h"
#import "MovieTableViewCell.h"
#import "MovieViewModel.h"

@interface MovieListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSArray *movies;
@end

@implementation MovieListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    // 获取列表数据
    [MovieListViewDataController fetchMovieListWithCompleteHandler:^(NSArray *list) {
        self.movies = list;
        [self.tableView reloadData];
    }];
}

#pragma mark -- UITableViewDelegate and UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.movies.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieTableViewCell *cell =[MovieTableViewCell cellWithTableView:tableView];
    MovieViewModel* movieViewModel = [MovieViewModel movieViewModelWithMovie:self.movies[indexPath.row]];
    cell.movieViewModel = movieViewModel;
    movieViewModel.movieSelectedBlcok = ^{
        // 处理视图的用户触发事件
    };
    return cell;
}


-(UITableView*)tableView{
    if (_tableView==nil) {
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
