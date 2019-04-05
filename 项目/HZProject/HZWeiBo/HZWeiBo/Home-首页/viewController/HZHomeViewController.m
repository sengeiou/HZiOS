//
//  HZHomeViewController.m
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "HZHomeViewController.h"
#import "HZStatusCell.h"
#import "HZStatusFrame.h"
#import <MJExtension.h>
#import "HZStatus.h"
#import <KMCGeigerCounter.h>

NSString *const kStringAPPKey = @"1103637002";
NSString *const kStringAPPSecret = @"4d6e7194c8b6ccf942b048bd86e50641";
NSString *const kStringRedirectUrl = @"www.baidu.com";
NSString *const kStringOAuthURL = @"https://api.weibo.com/oauth2/authorize";
NSString *const kStringAccessTokenURL = @"https://api.weibo.com/oauth2/access_token";
NSString *const khome_timelineURL = @"https://api.weibo.com/2/statuses/home_timeline.json";

@interface HZHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *statusFrames;
@end

@implementation HZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [KMCGeigerCounter sharedGeigerCounter].enabled = YES;
    [self.view addSubview:self.tableView];
    [self requestStatusList];
}

-(void)requestStatusList{
    //设置GET参数
    NSDictionary *parameters =
    @{
      @"client_id":kStringAPPKey,
      @"client_secret":kStringAPPSecret,
      @"access_token":@"2.00RlQrbCo5kgMBf61e4ec83ewActCB",
      };
    
    [[AFHTTPSessionManager manager] GET:khome_timelineURL parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *statusArray = [HZStatus mj_objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (HZStatus *status in statusArray) {
            HZStatusFrame *statusFrame = [[HZStatusFrame alloc] init];
            statusFrame.status = status;
            [statusFrameArray addObject:statusFrame];
        }
        
        [self.statusFrames addObjectsFromArray:statusFrameArray];
        
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"=====>:%@",error);
    }];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statusFrames.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HZStatusCell *cell = [HZStatusCell cellWithTableView:tableView];
    cell.statusFrame = self.statusFrames[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HZStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)statusFrames{
    if (_statusFrames ==nil) {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
