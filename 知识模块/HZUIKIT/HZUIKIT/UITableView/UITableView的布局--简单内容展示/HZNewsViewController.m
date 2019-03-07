//
//  HZNewsViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZNewsViewController.h"
#import "HZNewsCell.h"
#import "HZNewsFrame.h"
#import "HZNews.h"
#import <MJExtension.h>

#import "YYFPSLabel.h"
#import <YYKit.h>
#import "HZNewsData.h"
#import <KMCGeigerCounter.h>



#define WeakSelf(type) __weak __typeof__(type) weakSelf = type;
#define StrongSelf(type) __strong __typeof__(type) strongSelf = type;

@interface HZNewsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray *newsFrames;

@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@end

@implementation HZNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[KMCGeigerCounter sharedGeigerCounter].enabled = YES;

    [self.view addSubview:self.tableView];
    
    _fpsLabel = [[YYFPSLabel alloc] initWithFrame:CGRectMake(20, 100, 30, 20)];
    [_fpsLabel sizeToFit];
    [self.view addSubview:_fpsLabel];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self requestNewsData];
    });
    
   

}

-(void)requestNewsData{
    NSArray *newsList = [HZNewsData newsData];
    NSArray *newsModelArray = [HZNews mj_objectArrayWithKeyValuesArray:newsList];
    for (HZNews *news in newsModelArray) {
        HZNewsFrame *newsFrame = [[HZNewsFrame alloc] init];
        newsFrame.news = news;
        [self.newsFrames addObject:newsFrame];
    }
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsFrames.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HZNewsCell *cell = [HZNewsCell cellWithTableView:tableView];
    cell.newsFrame = self.newsFrames[indexPath.row];
    /*
     __weak typeof(cell)weakCell = cell;
     __weak typeof(self)weakSelf = self;
     */
    
    @weakify(self);
    @weakify(cell);
    cell.ingoreUnInterestingItemBlock = ^{
       
        @strongify(self);
        @strongify(cell);
        [self.tableView beginUpdates];
        // iOS 关于indexPathForCell:返回nil的问题: 当cell为invisible（屏幕不可见）时，返回的indexpath为nil；
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
         [self.newsFrames removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    };
    return cell;
    
    /*
       beginUpdates/endUpdates
     + 必须成对出现
     + 使用者两个方法执行 插入、删除等操作会使得动画更加流畅
     + 在动态改变一些行（row）的高度时自带动画，并且不需要Reload row（不用调用cellForRow，仅仅需要调用heightForRow，这样效率最高）
     */
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HZNewsFrame *newFrame = self.newsFrames[indexPath.row];
    
    return newFrame.cellHeight;
}

-(UITableView*)tableView{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

-(NSMutableArray*)newsFrames{
    if (_newsFrames == nil) {
        _newsFrames = [NSMutableArray array];
    }
    return _newsFrames;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    NSLog(@"HZNewsViewController dealloc!!");
}


@end
