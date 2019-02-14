//
//  HZNEMainPageHeaderViewController.m
//  HZUIKIT
//
//  Created by 华天杰 on 2017/3/27.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZNEMainPageHeaderViewController.h"
#import "HZNEMainPageHeaderCollectionViewCell.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define CONTENT_HEIGHT 35.0f
static NSString* const collectionViewCellIdentifer = @"ZNEMainPageHeaderCollectionViewCell";

@interface HZNEMainPageHeaderViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView* contentCollectionView;
@end

@implementation HZNEMainPageHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout =UIRectEdgeNone;
    [self.view setBackgroundColor:[UIColor yellowColor]];
    [self hz_layoutSubViews];
}

-(void)hz_layoutSubViews{
    [self.view addSubview:self.contentCollectionView];
}


#pragma mark- UICollectionViewDelegate and UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HZNEMainPageHeaderCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifer forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor orangeColor]];
    cell.titleLabel.text = [NSString stringWithFormat:@"head:%ld",indexPath.row];
    return cell;
}



-(UICollectionView*)contentCollectionView{
    if (_contentCollectionView==nil) {
        CGRect collectionViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, CONTENT_HEIGHT);
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _contentCollectionView = [[UICollectionView alloc] initWithFrame:collectionViewFrame collectionViewLayout:flowLayout];
        _contentCollectionView.delegate = self;
        _contentCollectionView.dataSource = self;
        [_contentCollectionView setBackgroundColor:[UIColor whiteColor]];
        [_contentCollectionView registerClass:NSClassFromString(@"HZNEMainPageHeaderCollectionViewCell") forCellWithReuseIdentifier:collectionViewCellIdentifer];
        
    }
    return _contentCollectionView;
}


#pragma mark- UICollectionViewFlowLayoutDelegate
// 改变每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
   return (CGSize){60,CONTENT_HEIGHT};
}
// 每个cell之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
