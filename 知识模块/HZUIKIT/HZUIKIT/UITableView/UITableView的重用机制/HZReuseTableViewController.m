//
//  HZReuseTableViewController.m
//  HZUIKIT
//
//  Created by 华天杰 on 2019/2/25.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import "HZReuseTableViewController.h"
#import "IndexedTableView.h"

@interface HZReuseTableViewController ()<UITableViewDelegate,UITableViewDataSource,IndexedTableViewDataSource>

@property(nonatomic,strong)NSMutableArray *titleDataSource;
@property(nonatomic,strong)IndexedTableView* indexTableView;
@property(nonatomic,strong)UIButton *button;

@end

@implementation HZReuseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _indexTableView = [[IndexedTableView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    _indexTableView.delegate = self;
    _indexTableView.dataSource = self;
    _indexTableView.indexedDataSource = self;
    
    [self.view addSubview:_indexTableView];
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    _button.backgroundColor = UIColor.redColor;
    [_button setTitle:@"reloadTable" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(doAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    _titleDataSource = [NSMutableArray array];
    for (int i = 0;  i < 100 ; i++) {
        [_titleDataSource addObject:@(i+1)];
    }
    
    
}

-(NSArray<NSString *> *)indexTitlesForIndexTableView:(UITableView *)tableView{
    static BOOL change = NO;
    if (change) {
        change = NO;
        return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M"];
    }else{
        change = YES;
        return @[@"A",@"B",@"C",@"D",@"E",@"F"];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _titleDataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifer = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        NSLog(@"%p,新创建cell",__func__);
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_titleDataSource[indexPath.row]];
    return  cell;
}

-(void)doAction{
    NSLog(@"reloadData");
    [_indexTableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
