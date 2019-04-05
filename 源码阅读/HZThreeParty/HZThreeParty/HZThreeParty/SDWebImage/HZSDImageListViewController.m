//
//  HZSDImageListViewController.m
//  HZThreeParty
//
//  Created by KB on 2018/5/31.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZSDImageListViewController.h"
#import <UIImageView+WebCache.h>
#import "YYFPSLabel.h"

#import "UIButton+HZ.h"

@interface HZSDImageListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray* images;
@end

@implementation HZSDImageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.images = [NSMutableArray array];
    for (NSInteger index=0; index<100; index++) {
        [self.images addObject:@"https://upload-images.jianshu.io/upload_images/1400498-3218bbafb03cbc23.JPG"];
    }
    [self.view addSubview:self.tableView];
    
    YYFPSLabel *label = [[YYFPSLabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 30 -100, 50, 30)];
    [self.view addSubview:label];
    
    NSLog(@"%@",[UIDevice currentDevice].systemVersion);
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.images.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellId = @"HZSDImageListViewController";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
//        UIImageView *centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-100)/2, 20, 100, 100)];
//        centerImageView.tag = 100;
//        [cell.contentView addSubview:centerImageView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-100)/2, 20, 100, 100)];
//        [button setBackgroundColor:UIColor.orangeColor];
        button.tag = 100;
        [cell.contentView addSubview:button];
    }
//    UIImageView *centerImageView = (UIImageView*)[cell.contentView viewWithTag:100];
//    centerImageView.layer.cornerRadius = 50;
//    [centerImageView setBackgroundColor:UIColor.orangeColor];
//    centerImageView.clipsToBounds= YES;
//    [centerImageView sd_setImageWithURL:[NSURL URLWithString:self.images[indexPath.row]] placeholderImage:[UIImage imageNamed:@"df_icon_live_shjf"]];
    
    UIButton *button = [cell.contentView viewWithTag:100];
    [button setTitle:@"test 123" forState:UIControlStateNormal];
    [button hz_addRounderCornerWithRadius:50 size:button.frame.size backgroundColor:UIColor.orangeColor];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}


-(UITableView*)tableView{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
